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
    
    init() {
    }
    
    deinit {
        print("Deinit in main page coordinator")
    }
    func goToCart() {
        self.route(to: \.pushCart)
        print("go to cart")
    }
    
    func goToProduct(id: Int) {
        self.route(to: \.pushProduct, id)
    }
  
}

extension MainPageCoordinator {
    @ViewBuilder func makeStart() -> some View  {
        MainPageView(vm: MainPageViewModel())
    }
    
    @ViewBuilder func makeCart()->some View {
        CartView(vm: CartViewModel())
    }
    
    @ViewBuilder func makeProduct(id: Int = 0) -> some View {
        ProductView(vm: ProductViewModel(id: id))
    }
}
