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


    @IBOutlet weak var welcomeLabel: UITextView!
    @IBOutlet weak var topRightButton: UIButton!
    @IBOutlet weak var topLeftButton: UIButton!
    @IBOutlet weak var bottomRightButton: UIButton!
    @IBOutlet weak var bottomLeftButton: UIButton!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var page1Array: [String] = []
    var page2Array: [String] = []
    var page3Array: [String] = []
    var page4Array: [String] = []
    var page5Array: [String] = []
    var page6Array: [String] = []
    var page7Array: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome " + appDelegate.userSignedIn.displayName! + "!"
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
