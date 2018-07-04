//
//  Routers.swift
//  BookDiscover
//
//  Created by Asier Zapata on 04/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import Foundation
import Compass

struct ProfileRoute: Routable {
    func navigate(to location: Location, from currentController: CurrentController) throws {
        // [1] Examine arguments
//        guard let userId = location.arguments["userId"] else {
//            return
//        }
        
        // [2] Create the controller
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        currentController.navigationController?.pushViewController(controller, animated: true)
    }
}

struct LibraryRoute: Routable {
    func navigate(to location: Location, from currentController: CurrentController) throws {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LibraryViewController") as! LibraryViewController
        currentController.navigationController?.pushViewController(controller, animated: true)
    }
}

struct ExploreRoute: Routable {
    func navigate(to location: Location, from currentController: CurrentController) throws {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ExploreViewController") as! ExploreViewController
        currentController.navigationController?.pushViewController(controller, animated: true)
    }
}
