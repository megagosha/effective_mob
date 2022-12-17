import SwiftUI
import Stinsen

final class CartCoordinator: NavigationCoordinatable {
    
    let stack = NavigationStack(initial: \CartCoordinator.start)
    
    @Root var start = makeStart
        
    init() {
    }
}

extension CartCoordinator {
    @ViewBuilder func makeStart() -> some View  {
        CartView(vm: CartViewModel())
    }
}
