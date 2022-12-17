//
//  ProductModelView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation
import Combine
import SwiftUI
import Stinsen

enum ProductNavigation {
    case back
    case cart
}

class ProductViewModel: ObservableObject {
        
    @Published public var product: Device = Device.makeEmpty()
    
    @Published public var pictures: [URL] = []
    
    @Published public var colors: [Color] = []
    
    @Published public var selectedColor: Color = .gray
    
    @Published public var selectedStorage: String = ""
    
    @Published public var storageOptions: [String] = []
    
    @Published private(set) var isRefreshing = true
    
    @Published var hasError = false
    
    @RouterObject var router: NavigationRouter<MainPageCoordinator>?

    private let apiService: APIService
    
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private let responseSubject = PassthroughSubject<Device, Never>()
    
    private var bag = Set<AnyCancellable>()
    
    public let onAppearSubject = PassthroughSubject<Void, Never>()

    init(id: Int, apiService: APIService = APIService()) {
        self.apiService = apiService
        bindInput()
        bindOutput()
        onAppearSubject.send()
    }
    
    private func bindInput() {
        let req = GetDeviceInfoRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: req)
                    .catch { [weak self] error -> Empty<Device, Never> in
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
            } receiveValue: { [weak self] product in
                self?.product = product
                self?.convertToUrl()
                self?.convertColors()
                self?.prepareCapacityOptions()
                self?.isRefreshing = false
            }
        bag.insert(responseStream)
    }
    
    private func convertToUrl() {
        pictures = product.images.compactMap{ URL(string: $0) }
    }
    
    private func prepareCapacityOptions() {
        storageOptions = product.capacity.map({ $0 + "GB"})
        selectedStorage = storageOptions.isEmpty ? "" : storageOptions[0]
    }
    
    private func convertColors() {
        colors = product.color.map({ Color.hexStringToUIColor(hex: $0)})
        selectedColor = colors.isEmpty ? Color(.gray) : colors[0]
    }
    
    public func back() {
        router?.pop()
    }
    
    public func goToCart() {
        router?.coordinator.goToCart()
    }
}

