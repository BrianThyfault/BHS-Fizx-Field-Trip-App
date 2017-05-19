//
//  Data.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/18/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import Foundation
import Firebase

final class Data {
    
    // Can't init is singleton
    private init()
    {
    }
    
    // MARK: Shared Instance
    
    static let shared = Data()
    
    // MARK: Local Variable
    
    var page1Array: [String] = []
    var page2Array: [String] = []
    var page3Array: [String] = []
    var page4Array: [String] = []
    var page5Array: [String] = []
    var page6Array: [String] = []
    var page7Array: [String] = []
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func submitAnswers()
    {
        let user: FIRUser = appDelegate.userSignedIn
        appDelegate.updateDatabase(uid: (user.uid), displayName: (user.displayName)!, page1: page1Array, page2: page2Array, page3: page3Array, page4: page4Array, page5: page5Array, page6: page6Array, page7: page7Array)
    }
    
}
