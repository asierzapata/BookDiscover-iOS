//
//  RouterReducers.swift
//  BookDiscover
//
//  Created by Asier Zapata on 06/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift

func routerReducer(action: Action, state: RoutingState?) -> RoutingState {
    var state = state ?? RoutingState()
    
    switch action {
        case let routingAction as RouterAction:
            state.navigationState = routingAction.destination
        case let loginSuccessful as LoginSuccessful:
            state.tabViewController = loginSuccessful.tabViewController
        default: break
    }
    
    return state
}
