//
//  Page6ViewController.swift
//  GoogleFirebaseSignIn
//
//  Created by Brian W Thyfault on 5/18/17.
//  Copyright © 2017 Brian W Thyfault. All rights reserved.
//

import UIKit

class Page6ViewController: UIViewController {

    @IBOutlet weak var Question1TextField: UITextField!
    @IBOutlet weak var Question2TextField: UITextField!
    @IBOutlet weak var Question3TextField: UITextField!
    @IBOutlet weak var Question4TextField: UITextField!
    @IBOutlet weak var Question5TextField: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var integer = 0
    var page6Array: [String] = []
    var alert:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(integer == 0)
        {
            Data.shared.page6Array = appDelegate.page6Questions
            pullAnswers()
            integer += 1
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        page6Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page6Array = page6Array
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
        if(appDelegate.page6Questions.count == 5)
        {
            Question1TextField.text = appDelegate.page6Questions[0]
            Question2TextField.text = appDelegate.page6Questions[1]
            Question3TextField.text = appDelegate.page6Questions[2]
            Question4TextField.text = appDelegate.page6Questions[3]
            Question5TextField.text = appDelegate.page6Questions[4]
        }
    }

    @IBAction func submitButton(_ sender: Any) {
        self.page6Array = [Question1TextField.text!, Question2TextField.text!, Question3TextField.text!, Question4TextField.text!, Question5TextField.text!]
        Data.shared.page6Array = page6Array
        Data.shared.submitAnswers()
        showAlert()
    }


}
