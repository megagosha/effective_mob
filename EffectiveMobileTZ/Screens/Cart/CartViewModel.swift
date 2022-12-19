//
//  CartViewModel.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import Combine
import SwiftUI
import Stinsen

enum CartNavigation: Equatable {
    case back
    case product(Int)
}

final class CartViewModel: ObservableObject {
    
    @RouterObject var router: NavigationRouter<MainPageCoordinator>?

    @Published var hasError = false
    
    @Published var isRefreshing = true
    
    @Published var cart: Cart = Cart(basket: [], delivery: "", id: "", total: 0)
    
    @Published var itemCounters: [Int] = []
    
    @Published var itemsInCart: Int = 0
    
    private let apiService: APIService
    
    private let errorSubject = PassthroughSubject<APIServiceError, Never>()
    
    private let responseSubject = PassthroughSubject<Cart, Never>()
    
    private var bag = Set<AnyCancellable>()

    public let onAppearSubject = PassthroughSubject<Void, Never>()

    init(apiService: APIService = APIService(), test: Bool = false) {
        self.apiService = apiService
        bindInput()
        bindOutput()
        onAppearSubject.send()
    }
    
    private func bindInput() {
        let req = GetCartInfoRequest()
        let responsePublisher = onAppearSubject
            .flatMap { [apiService] _ in
                apiService.response(from: req)
                    .catch { [weak self] error -> Empty<Cart, Never> in
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
            } receiveValue: { [weak self] cart in
                self?.cart = cart
                self?.createCounters()
                self?.updateItemsInCart()
                self?.isRefreshing = false
            }
        bag.insert(responseStream)
    }
    
    func createCounters() {
            itemCounters = Array(
                repeating: 1,
                count: self.cart.basket.count
            )
    }

    func showProduct(_ product: Int) {
//        onNavigation(.product(product))
    }
    
    func getTotal()->String {
        var res = 0
        for (ix, el) in itemCounters.enumerated() {
            res += cart.basket[ix].price * el
        }
        return "$" + (numberFormatter.string(from: NSNumber(value: res)) ?? "Err")
        
    }
    
    func updateItemsInCart() {
        self.itemsInCart = itemCounters.reduce(0, +)
    }
    
    private func getCount()->Int {
        return itemCounters.reduce(0, +)
    }
    
    public func removeProduct(_ product: CartItem) {
        let ix = cart.basket.firstIndex(where: {$0.id == product.id})
        guard ix != nil else {
            return
        }
        itemCounters.remove(at: ix!)
        cart.basket.remove(at: ix!)
        updateItemsInCart()
    }
    
    func showMap() {
        print("Show map in vm triggered")
    }
    
    func back() {
        router!.popLast()
    }
    
    let numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 0
        numberFormatter.groupingSize = 3
        numberFormatter.groupingSeparator = ","
        return numberFormatter
    }()
}
