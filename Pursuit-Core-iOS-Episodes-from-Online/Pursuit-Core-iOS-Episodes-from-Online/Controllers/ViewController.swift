//
//  ShowsViewController.swift
//  Pursuit-Core-iOS-Episodes-from-Online
//
//  Created by Benjamin Stone on 9/5/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var showListings = [showModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClientManager.shared.getElements { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let success):
                self.showListings = success
                dump(self.showListings)
            }
        }
        // Do any additional setup after loading the view.
    }

    
    

}

