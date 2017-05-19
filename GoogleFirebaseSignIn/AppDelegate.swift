//
//  AppDelegate.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 4/12/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase
import CoreData
import IQKeyboardManagerSwift
//import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    
    var window: UIWindow?
    var databaseRef: FIRDatabaseReference!
    var userSignedIn: FIRUser!
    var uid: String = ""
    var displayName: String = ""
    var page1Questions:[String] = [] //HomeViewController.init().page1Array
    var page2Questions:[String] = [] //HomeViewController.init().page2Array
    var page3Questions:[String] = [] //HomeViewController.init().page3Array
    var page4Questions:[String] = [] //HomeViewController.init().page4Array
    var page5Questions:[String] = []
    var page6Questions:[String] = []
    var page7Questions:[String] = []

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FIRApp.configure()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        IQKeyboardManager.sharedManager().enable = true
        //IQKeyboardManager.sharedManager().shouldHidePreviousNext = true
        //IQKeyboardManager.sharedManager().enableAutoToolbar = false
        
        return true
    }
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: Any]?) -> Bool {
//        FIRApp.configure()
//        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
//        GIDSignIn.sharedInstance().delegate = self
//        return true
//    }

    func application(_ application: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any])
        -> Bool {
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
        }
    

//    func shared() -> AppDelegate {
//        return UIApplication.shared.delegate as! AppDelegate
//    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor GIDUser: GIDGoogleUser!, withError error: Error?) {
        if let err = error {
            print("Failed to sign in", err)
                    }
        if(GIDSignIn.sharedInstance().hasAuthInKeychain() == false)
        {
            print("User exited Safari View")
            return
        }
        guard let authentication = GIDUser.authentication else {
            return
            //ViewController.init().notCorrectDomain()
        }
        
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
    
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            if let err = error {
                print("Failed to sign in", err)
            }
            
            print("\(GIDUser)")
            if(GIDUser?.hostedDomain == "bsd220.org" || GIDUser?.hostedDomain == "barrington220.org")
            {
                self.databaseRef = FIRDatabase.database().reference()
                self.databaseRef.child("user_profiles").child((user?.uid)!).observeSingleEvent(of: .value, with: { (snapshot) in
                    print("User Signed In")
                    let snapshot = snapshot.value as? NSDictionary
                    self.displayName = (user?.displayName)!
                    self.uid = (user?.uid)!
                    if (snapshot == nil)
                    {
                        self.createDatabase()
                        //self.databaseRef.child("user_profiles/StudentName").setValue("Brian Thyfault")
                    }
                    self.getDatabaseInfo()
                    self.userSignedIn = user
                    self.window?.rootViewController?.performSegue(withIdentifier: "home", sender: nil)
                    
                    })
                }
            else
            {
                print("Access Denied")
                GIDSignIn.sharedInstance().signOut()
                let alert = UIAlertController(title: "Sign in with 'BSD220' Google account", message: "This app is only for Barrington High School students, not the general public", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(okAction)
                UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func createDatabase()
    {
        print("Creating database for " + self.displayName)
        let nameUpdate = ["Name": self.displayName]
        let questionUpdates = ["Page1", "Page2", "Page3", "Page4"]
        let update = ["user_profiles/" + (self.uid): questionUpdates]
        let makeName = ["user_profiles/" + (self.uid): nameUpdate]
        self.databaseRef.updateChildValues(update)
        self.databaseRef.updateChildValues(makeName)
    }

    func updateDatabase(uid: String, displayName: String, page1: [String], page2: [String], page3: [String], page4: [String], page5: [String], page6: [String], page7: [String])
    {
        print("Updating questions")
        
        var page1Answers: [String:String] = [:]
        for i in 0..<page1.count {
            page1Answers["Question " + "\(i + 1)"] = page1[i]
        }
        let page1Update = ["user_profiles/" + (self.uid) + "/Page1": page1Answers]

        var page2Answers: [String:String] = [:]
        for i in 0..<page2.count {
            page2Answers["Question " + "\(i + 1)"] = page2[i]
        }
        let page2Update = ["user_profiles/" + (self.uid) + "/Page2": page2Answers]

        var page3Answers: [String:String] = [:]
        for i in 0..<page3.count {
            page3Answers["Question " + "\(i + 1)"] = page3[i]
        }
        let page3Update = ["user_profiles/" + (self.uid) + "/Page3": page3Answers]

        var page4Answers: [String:String] = [:]
        for i in 0..<page4.count {
            page4Answers["Question " + "\(i + 1)"] = page4[i]
        }
        let page4Update = ["user_profiles/" + (self.uid) + "/Page4": page4Answers]

        var page5Answers: [String:String] = [:]
        for i in 0..<page5.count {
            page5Answers["Question " + "\(i + 1)"] = page5[i]
        }
        let page5Update = ["user_profiles/" + (self.uid) + "/Page5": page5Answers]

        var page6Answers: [String:String] = [:]
        for i in 0..<page6.count {
            page6Answers["Question " + "\(i + 1)"] = page6[i]
        }
        let page6Update = ["user_profiles/" + (self.uid) + "/Page6": page6Answers]
        
        var page7Answers: [String:String] = [:]
        for i in 0..<page7.count {
            page7Answers["Question " + "\(i + 1)"] = page7[i]
        }
        let page7Update = ["user_profiles/" + (self.uid) + "/Page7": page7Answers]
        
        self.databaseRef.updateChildValues(page1Update)
        self.databaseRef.updateChildValues(page2Update)
        self.databaseRef.updateChildValues(page3Update)
        self.databaseRef.updateChildValues(page4Update)
        self.databaseRef.updateChildValues(page5Update)
        self.databaseRef.updateChildValues(page6Update)
        self.databaseRef.updateChildValues(page7Update)
    }
    
    func updateDatabaseForPage1(uid: String, displayName: String, page1: [String])
    {
        print("Updating questions for Page 1")
        var page1Answers: [String:String] = [:]
        for i in 0..<page1.count {
            page1Answers["Question " + "\(i + 1)"] = page1[i]
        }
        let page1Update = ["user_profiles/" + (self.uid) + "/Page1": page1Answers]
        self.databaseRef.updateChildValues(page1Update)
    }
    func updateDatabaseForPage2(uid: String, displayName: String, page2: [String])
    {
        print("Updating questions for Page 2")
        var page2Answers: [String:String] = [:]
        for i in 0..<page2.count {
            page2Answers["Question " + "\(i + 1)"] = page2[i]
        }
        let page2Update = ["user_profiles/" + (self.uid) + "/Page2": page2Answers]
        self.databaseRef.updateChildValues(page2Update)
    }
    func updateDatabaseForPage3(uid: String, displayName: String, page3: [String])
    {
        print("Updating questions for Page 3")
        var page3Answers: [String:String] = [:]
        for i in 0..<page3.count {
            page3Answers["Question " + "\(i + 1)"] = page3[i]
        }
        let page3Update = ["user_profiles/" + (self.uid) + "/Page3": page3Answers]
        self.databaseRef.updateChildValues(page3Update)
    }
    func updateDatabaseForPage4(uid: String, displayName: String, page4: [String])
    {
        print("Updating questions for Page 4")
        var page4Answers: [String:String] = [:]
        for i in 0..<page4.count {
            page4Answers["Question " + "\(i + 1)"] = page4[i]
        }
        let page4Update = ["user_profiles/" + (self.uid) + "/Page4": page4Answers]
        self.databaseRef.updateChildValues(page4Update)
    }

    func getDatabaseInfo()
    {
        //let userID = FIRAuth.auth()?.currentUser?.uid
        self.databaseRef.child("user_profiles").child(self.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            let page1Snap = snapshot.childSnapshot(forPath: "Page1").value as? NSDictionary
            for i in 0..<snapshot.childSnapshot(forPath: "Page1").childrenCount {
                let updatedValue = page1Snap?["Question " + "\(i + 1)"] as? String ?? ""
                print(updatedValue)
                print(Int(i))
                self.page1Questions.append(updatedValue)
            }
            
            let page2Snap = snapshot.childSnapshot(forPath: "Page2").value as? NSDictionary
            for i in 0..<snapshot.childSnapshot(forPath: "Page2").childrenCount {
                let updatedValue = page2Snap?["Question " + "\(i + 1)"] as? String ?? ""
                print(updatedValue)
                self.page2Questions.append(updatedValue)
            }
            
            let page3Snap = snapshot.childSnapshot(forPath: "Page3").value as? NSDictionary
            for i in 0..<snapshot.childSnapshot(forPath: "Page3").childrenCount {
                let updatedValue = page3Snap?["Question " + "\(i + 1)"] as? String ?? ""
                print(updatedValue)
                self.page3Questions.append(updatedValue)
            }
            
            let page4Snap = snapshot.childSnapshot(forPath: "Page4").value as? NSDictionary
            for i in 0..<snapshot.childSnapshot(forPath: "Page4").childrenCount {
                let updatedValue = page4Snap?["Question " + "\(i + 1)"] as? String ?? ""
                print(updatedValue)
                self.page4Questions.append(updatedValue)
            }
            
            print(self.page1Questions)
            print(self.page2Questions)
            print(self.page3Questions)
            print(self.page4Questions)

        })
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

