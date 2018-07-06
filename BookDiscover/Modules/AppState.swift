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

struct RoutingState: StateType {
    var navigationState: RoutingDestination
    
    init(navigationState: RoutingDestination = .login) {
        self.navigationState = navigationState
    }
}
