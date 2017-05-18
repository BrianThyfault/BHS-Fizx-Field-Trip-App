//
//  ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 4/12/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit


class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        GIDSignIn.sharedInstance().uiDelegate = self as GIDSignInUIDelegate
        
        //GIDSignIn.sharedInstance().signIn()
    }

    func notCorrectDomain()
    {
        let alert = UIAlertController(title: "Sign in with 'BSD220' Google account", message: "This app is only for Barrington High School students, not the general public", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }


}

