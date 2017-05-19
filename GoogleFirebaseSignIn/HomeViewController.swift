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

    @IBOutlet weak var welcomeLabel: UILabel!
    var page1Array: [String] = []
    var page2Array: [String] = []
    var page3Array: [String] = []
    var page4Array: [String] = []
    var page5Array: [String] = []
    var page6Array: [String] = []
    var page7Array: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func getAllPages() -> ([String], [String], [String], [String], [String], [String], [String])
    {
        return (page1Array, page2Array, page3Array, page4Array, page5Array, page6Array, page7Array)
    }
    
    func printArrays()
    {
        print(page1Array)
    }
    
    @IBAction func signOutButton(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
