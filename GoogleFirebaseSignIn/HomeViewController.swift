//
//  HomeViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/16/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    var page1Array: [String] = [""]
    var page2Array: [String] = [""]
    var page3Array: [String] = [""]
    var page4Array: [String] = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getAllPages() -> ([String], [String], [String], [String])
    {
        return (page1Array, page2Array, page3Array, page4Array)
    }
    
}
