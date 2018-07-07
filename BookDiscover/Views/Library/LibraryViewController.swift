//
//  LibraryViewController.swift
//  BookDiscover
//
//  Created by Asier Zapata on 04/07/2018.
//  Copyright © 2018 Asier Zapata. All rights reserved.
//

import ReSwift
import UIKit

class LibraryViewController: UIViewController {
    
    
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
    
    @IBAction func searchPressed(_ sender: Any) {
        print(">>>>> search pressed")
        store.dispatch(RouterAction(destination: .search))
    }
    
}

// MARK: - StoreSubscriber
extension LibraryViewController: StoreSubscriber {
    func newState(state: AppState) {
        //
        print(">>>>> new state from library",state)
    }
}
