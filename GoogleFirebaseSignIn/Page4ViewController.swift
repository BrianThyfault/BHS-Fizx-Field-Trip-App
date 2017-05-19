//
//  Page4ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/12/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase

class Page4ViewController: UIViewController {

    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page4Array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page4Array = appDelegate.page4Questions
            pullAnswers()
            integer += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page4Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page4Array = page4Array
        print("Page Flipped")
    }
    
    func pullAnswers()
    {
        if(appDelegate.page4Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page4Questions[0]
            Question2TextField.text = appDelegate.page4Questions[1]
            Question3TextField.text = appDelegate.page4Questions[2]
            Question4TextField.text = appDelegate.page4Questions[3]
            Question5TextField.text = appDelegate.page4Questions[4]
        }
    }
    
    @IBAction func submitButton(_ sender: Any) {
        self.page4Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page4Array = page4Array
        Data.shared.submitAnswers()
    }


}
