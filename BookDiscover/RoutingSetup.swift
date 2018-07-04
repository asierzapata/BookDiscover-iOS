//
//  RoutingSetup.swift
//  BookDiscover
//
//  Created by Asier Zapata on 04/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import UIKit
import Compass

extension AppDelegate {
    
    func setupRouting(rootController: UITabBarController) {
        // [1] Register scheme
        Navigator.scheme = "bookdiscover"
        
        // [2] Configure routes for Router
        postLoginRouter.routes = [
            "profile": ProfileRoute(),
            "library": LibraryRoute(),
            "explore": ExploreRoute()
        ]
        
        // [3] Register routes you 'd like to support
        Navigator.routes = Array(postLoginRouter.routes.keys)
        
        // [4] Do the handling
        Navigator.handle = { [weak self] location in
            let arguments = location.arguments
            
            // [5] Choose the current visible controller
            let currentController = rootController.selectedViewController
                ?? rootController
            
            // [6] Navigate
            self?.postLoginRouter.navigate(to: location, from: currentController)
        }
    
    }
    
}
