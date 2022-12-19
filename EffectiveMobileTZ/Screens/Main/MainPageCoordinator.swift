//
//  MainPageCoordinatorView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI
import Stinsen

final class MainPageCoordinator: NavigationCoordinatable {
    
    @Root var start = makeStart
    
    @Route(.push) var pushCart = makeCart
    
    @Route(.push) var pushProduct = makeProduct
    
    let stack = NavigationStack(initial: \MainPageCoordinator.start)

    var cartVm: CartViewModel
    
    var mainPageVm: MainPageViewModel
    
    init() {
        self.mainPageVm = MainPageViewModel()
        self.cartVm = CartViewModel()
    }
    
    deinit {
        print("Deinit in main page coordinator")
    }
//    func goToCart() {
//        self.route(to: \.pushCart)
//        print("go to cart")
//    }
//    
//    func goToProduct(id: Int) {
//        self.route(to: \.pushProduct, id)
//    }
  
}

extension MainPageCoordinator {
    @ViewBuilder func makeStart() -> some View  {
        MainPageView(vm: self.mainPageVm, cartVm: cartVm)
    }
    
    @ViewBuilder func makeCart()->some View {
        CartView(vm: self.cartVm)
    }
    
    @ViewBuilder func makeProduct(id: Int = 0) -> some View {
        ProductView(vm: ProductViewModel(id: id))
    }
}
