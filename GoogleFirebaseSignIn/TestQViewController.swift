//
//  HomeViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 4/28/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase

class TestQViewController: UIViewController {
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var welcomeUser: UILabel!
    @IBOutlet weak var page1TextView: UITextView!
    @IBOutlet weak var page2TextField: UITextField!
    @IBOutlet weak var page22text: UITextField!
    @IBOutlet weak var page23text: UITextField!
    @IBOutlet weak var page3TextField: UITextField!
    @IBOutlet weak var page32text: UITextField!
    @IBOutlet weak var page33text: UITextField!
    @IBOutlet weak var page4TextField: UITextField!
    @IBOutlet weak var page42text: UITextField!
    @IBOutlet weak var page43text: UITextField!
    @IBOutlet weak var loadDataButton: UIButton!
    
    var page1Array: [String] = []
    var page2Array: [String] = []
    var page3Array: [String] = []
    var page4Array: [String] = []
    var activeField: UITextField?
    
    //var user: UserData = UserData()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user: FIRUser = appDelegate.userSignedIn
        print("Welcome", user.displayName!)
        welcomeUser.text = ("Logged in as: " + user.displayName!)
        getDatabaseInfo()
    }
    
    func getDatabaseInfo()
    {
        if(appDelegate.page1Questions.count == 5)
        {
            page1TextView.text = appDelegate.page1Questions[0]
            page2TextField.text = appDelegate.page2Questions[0]
            page22text.text = appDelegate.page2Questions[1]
            page23text.text = appDelegate.page2Questions[2]
            page3TextField.text = appDelegate.page3Questions[0]
            page32text.text = appDelegate.page3Questions[1]
            page33text.text = appDelegate.page3Questions[2]
            page4TextField.text = appDelegate.page4Questions[0]
            page42text.text = appDelegate.page4Questions[1]
            page43text.text = appDelegate.page4Questions[2]
            loadDataButton.isHidden = true
        }
    }
    
    @IBAction func pullDatabaseButton(_ sender: Any) {
        self.getDatabaseInfo()
    }
    
    @IBAction func submitButton(_ sender: Any) {
        let user: FIRUser = appDelegate.userSignedIn
        page1Array = [page1TextView.text]
        page2Array = [page2TextField.text!, page22text.text!, page23text.text!]
        page3Array = [page3TextField.text!, page32text.text!, page33text.text!]
        page4Array = [page4TextField.text!, page42text.text!, page43text.text!]
        appDelegate.updateDatabase(uid: (user.uid), displayName: (user.displayName)!, page1: page1Array, page2: page2Array, page3: page3Array, page4: page4Array)
    }
   
    
  }
