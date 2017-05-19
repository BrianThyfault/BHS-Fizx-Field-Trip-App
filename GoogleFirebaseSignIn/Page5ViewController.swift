//
//  Page5ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/18/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class Page5ViewController: UIViewController {

    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page5Array: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page5Array = appDelegate.page5Questions
            pullAnswers()
            integer += 1
        }
        // Do any additional setup after loading the view.
    }
    
    func pullAnswers()
    {
        if(appDelegate.page5Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page5Questions[0]
            Question2TextField.text = appDelegate.page5Questions[1]
            Question3TextField.text = appDelegate.page5Questions[2]
            Question4TextField.text = appDelegate.page5Questions[3]
            Question5TextField.text = appDelegate.page5Questions[4]
        }
    }

    @IBAction func submitButton(_ sender: Any) {
        self.page5Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page5Array = page5Array
        Data.shared.submitAnswers()
    }

}
