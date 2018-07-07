
//
//  RouterActions.swift
//  BookDiscover
//
//  Created by Asier Zapata on 06/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift

struct RouterAction: Action {
    let destination: RoutingDestination
}

struct LoginSuccessful: Action {
    let tabViewController: UITabBarController
}
