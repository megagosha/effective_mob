//
//  ItemsStore.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 12.12.2022.
//

import Foundation
import Combine
import Stinsen

enum MainPageNavigation: Equatable {
    case selectProduct(Int)
    case cart
}

final class MainPageViewModel: ObservableObject {
    
    @Published public var hotSales: [HotSales] = []
    
    @Published public var bestSales: [BestSeller] = []
    
    @Published private(set) var isRefreshing = true
    
    @Published var hasError = false
    
    @Published var selectedFilter = FilterSelection()
    
    @Published var selectedItem: String = "Explorer"
    
    @RouterObject var router: NavigationRouter<MainPageCoordinator>!

    var tabItems = [
        TabBarItem(id: 0, name: "Explorer", image: "Explorer", goTo: nil),
        TabBarItem(id: 1, name: "Cart", image: "Cart", goTo: .cart),
        TabBarItem(id: 2, name: "Saved", image: "HeartTab", goTo: nil),
        TabBarItem(id: 3, name: "Profile", image: "Profile", goTo: nil),
    ]
    
    private let apiService: APIService
    
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private let responseSubject = PassthroughSubject<MainPageModel, Never>()
    
    private var bag = Set<AnyCancellable>()
    
    public let onAppearSubject = PassthroughSubject<Void, Never>()
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
        bindInput()
        bindOutput()
        onAppearSubject.send()
    }
    
    private func bindInput() {
        let req = GetMainPageDataRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: req)
                    .catch { [weak self] error -> Empty<MainPageModel, Never> in
                        self?.errorSubject.send(error)
                        self?.hasError = true
                        print("Error occured while fetching URL \(error)")
                        return .init()
                    }
            }
        let stream = responsePublisher
            .share()
            .subscribe(responseSubject)
        bag.insert(stream)
    }
    
    private func bindOutput() {
        let responseStream = responseSubject
            .sink { [weak self] res in
                do {self?.isRefreshing = false}
            } receiveValue: { [weak self] mainPageData in
                self?.hotSales = mainPageData.home_store
                self?.bestSales = mainPageData.best_seller
                self?.isRefreshing = false
            }
        bag.insert(responseStream)
    }
    
    public func showProduct(_ productId: Int) {
        router.route(to: \.pushProduct, productId)
    }
    
    func goToCart() {
        self.router.coordinator.route(to: \.pushCart)
    }
}

extension MainPageViewModel {
    enum ApiError: LocalizedError {
        case custom(error: Error)
        case failedToDecode
        case invalidStatusCode
        
        var errorDescription: String? {
            switch self {
            case .failedToDecode:
                return "JSON decoder failed to decode response"
            case .invalidStatusCode:
                return "Invalid HTTP code received"
            case .custom(let error):
                return error.localizedDescription
            }
        }
    }
}
