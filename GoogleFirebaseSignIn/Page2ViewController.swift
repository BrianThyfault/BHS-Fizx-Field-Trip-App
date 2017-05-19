//
//  Page2ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/12/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase

class Page2ViewController: UIViewController {
    
    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page2Array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page2Array = appDelegate.page2Questions
            pullAnswers()
            integer += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page2Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page2Array = page2Array
        print("Page Flipped")
    }
    
    func pullAnswers()
    {
        if(appDelegate.page2Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page2Questions[0]
            Question2TextField.text = appDelegate.page2Questions[1]
            Question3TextField.text = appDelegate.page2Questions[2]
            Question4TextField.text = appDelegate.page2Questions[3]
            Question5TextField.text = appDelegate.page2Questions[4]
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        self.page2Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page2Array = page2Array
        Data.shared.submitAnswers()
    }


}
