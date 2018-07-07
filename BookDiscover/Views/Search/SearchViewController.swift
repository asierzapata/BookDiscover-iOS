//
//  SearchViewController.swift
//  BookDiscover
//
//  Created by Asier Zapata on 05/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift
import UIKit

class SearchViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        store.unsubscribe(self)
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        store.dispatch(RouterAction(destination: .library))
    }
    
}

// MARK: - StoreSubscriber
extension SearchViewController: StoreSubscriber {
    func newState(state: AppState) {
        //
        print(">>>>> new state from search",state)
    }
}
