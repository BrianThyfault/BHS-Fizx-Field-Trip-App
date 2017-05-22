//
//  Page1ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/11/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit
import Firebase

class Page1ViewController: UIViewController {

    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page1Array: [String] = Data.shared.page1Array
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page1Array = appDelegate.page1Questions
            pullAnswers()
            integer += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page1Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page1Array = page1Array
        print("Page Flipped")
    }
    
    func showAlert() {
        self.alert = UIAlertController(title: "Answers saved on all pages!", message: nil, preferredStyle: .alert)
        self.present(self.alert, animated: true, completion: nil)
        Timer.scheduledTimer(timeInterval: 1.2, target: self, selector: #selector(dismissAlert), userInfo: nil, repeats: false)
    }
    
    func dismissAlert(){
        self.alert.dismiss(animated: true, completion: nil)
    }
    
    func pullAnswers()
    {
        if(appDelegate.page1Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page1Questions[0]
            Question2TextField.text = appDelegate.page1Questions[1]
            Question3TextField.text = appDelegate.page1Questions[2]
            Question4TextField.text = appDelegate.page1Questions[3]
            Question5TextField.text = appDelegate.page1Questions[4]
        }
    }

    
    @IBAction func submitButton(_ sender: Any) {
        self.page1Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page1Array = page1Array
        Data.shared.submitAnswers()
        showAlert()
    }

    
}
