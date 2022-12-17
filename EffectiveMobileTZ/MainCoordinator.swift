//
//  MainCoordinator.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import Foundation
import Stinsen
import SwiftUI

final class MainCoordinator: NavigationCoordinatable {
    var stack: Stinsen.NavigationStack<MainCoordinator>
    
    @Root var main = start
    init() {
        stack = NavigationStack(initial: \MainCoordinator.main)
    }
}


extension MainCoordinator {
    func start()->NavigationViewCoordinator<MainPageCoordinator> {
        return NavigationViewCoordinator(MainPageCoordinator())
    }
}
