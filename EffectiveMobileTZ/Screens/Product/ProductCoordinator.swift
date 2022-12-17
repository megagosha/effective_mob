import SwiftUI
import Stinsen

final class ProductCoordinator: NavigationCoordinatable {

    @Root var start = makeStart

    let stack = NavigationStack(initial: \ProductCoordinator.start)
            
    init() {
    }
}


extension ProductCoordinator {
    @ViewBuilder func makeStart() -> some View  {
        ProductView(vm: ProductViewModel(id: 0))
    }
}
