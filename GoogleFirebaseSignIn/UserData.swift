//
//  UserData.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/1/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class UserData:NSObject {
    //let appDelegate = AppDelegate.init().shared()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var user: FIRUser // = AppDelegate.init().getUser()
    
    var displayName: String = ""
    var email: String = ""
    var uid: String = ""
    var page1: [String] = [] //HomeViewController.init().page1Array //["Not Answered"]
    var page2: [String] = [] //HomeViewController.init().getPage2Answers() //["Not Answered"]
    var page3: [String] = [] //HomeViewController.init().getPage3Answers() //["Not Answered"]
    var page4: [String] = [] //HomeViewController.init().getPage4Answers() //["Not Answered"]
    
    override init() {
        user = appDelegate.userSignedIn
        displayName = user.displayName!
        email = user.email!
        uid = user.uid
    }
    
    func getName() -> String {
        return "Nope" //appDelegate.userSignedIn.displayName!
    }
    
    func getEmail() -> String {
          return "Nope" //appDelegate.userSignedIn.email!
    }
  
}
