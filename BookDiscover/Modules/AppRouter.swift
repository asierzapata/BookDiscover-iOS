//
//  AppRouter.swift
//  BookDiscover
//
//  Created by Asier Zapata on 06/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift

enum RoutingDestination: String {
    case login = "GoogleSignInController"
    case search = "SearchViewController"
    case library = "LibraryViewController"
    case explore = "ExploreViewController"
    case profile = "ProfileViewController"
}

enum RoutingTab : Int {
    case libraryTab = 0
    case exploreTab = 1
    case profileTab = 2
}

final class AppRouter {
    
    let window: UIWindow
    //let navigationController: UINavigationController?
    var tabController : UITabBarController? = nil
    
    init(window: UIWindow) {
        //tabController = window.rootViewController as! UITabBarController
        //navigationController = UINavigationController()
        self.window = window
        
        store.subscribe(self) {
            $0.select {
                $0.routingState
            }
        }

        //store.subscribe(self)
    }
    
    fileprivate func pushTabChange(identifier: Int){
        tabController?.selectedIndex = identifier
    }
    
    fileprivate func pushViewControllerToTab(index: Int, identifier: String) {
        let viewController = instantiateViewController(identifier: identifier)
        var arrayViewControllers = tabController?.customizableViewControllers
        arrayViewControllers!.remove(at: index)
        arrayViewControllers!.insert(viewController, at: index)
        tabController?.setViewControllers(arrayViewControllers, animated: true)
        tabController?.selectedViewController = viewController
    }
    
    fileprivate func pushViewControllerToWindow(identifier: String) {
        let viewController = instantiateViewController(identifier: identifier)
        window.rootViewController = viewController
    }
    
    private func instantiateViewController(identifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}

// MARK: - StoreSubscriber
extension AppRouter: StoreSubscriber {
    func newState(state: RoutingState) {
        print(">>>>> new ROUTING state ", state)
        
        if tabController == nil && state.tabViewController != nil {
            self.tabController = state.tabViewController
            print(self.tabController?.viewControllers)
            return
        }
            
        if state.tabViewController == nil {
            pushViewControllerToWindow(identifier: state.navigationState.rawValue)
        } else {
            //pushTabChange(identifier: state.tabState.rawValue)
            pushViewControllerToTab(index:  state.tabState.rawValue, identifier: state.navigationState.rawValue)
        }

    }
}
