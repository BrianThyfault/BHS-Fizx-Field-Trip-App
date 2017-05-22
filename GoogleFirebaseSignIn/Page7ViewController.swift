//
//  Page7ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/18/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class Page7ViewController: UIViewController {

    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page7Array: [String] = []
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page7Array = appDelegate.page7Questions
            pullAnswers()
            integer += 1
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page7Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page7Array = page7Array
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
        if(appDelegate.page7Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page7Questions[0]
            Question2TextField.text = appDelegate.page7Questions[1]
            Question3TextField.text = appDelegate.page7Questions[2]
            Question4TextField.text = appDelegate.page7Questions[3]
            Question5TextField.text = appDelegate.page7Questions[4]
        }
    }

    @IBAction func submitButton(_ sender: Any) {
        self.page7Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page7Array = page7Array
        Data.shared.submitAnswers()
        showAlert()
    }
}
