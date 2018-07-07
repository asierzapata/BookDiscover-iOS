//
//  AppState.swift
//  BookDiscover
//
//  Created by Asier Zapata on 06/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift

struct AppState: StateType {
    let routingState: RoutingState
}

// MARK: - RoutingState
struct RoutingState: StateType {
    var navigationState: RoutingDestination
    var tabState: RoutingTab
    var tabViewController: UITabBarController?
    
    init(navigationState: RoutingDestination = .login, tabState: RoutingTab = .libraryTab, tabViewController: UITabBarController? = nil) {
        self.navigationState = navigationState
        self.tabState = tabState
        self.tabViewController = tabViewController
    }
}

