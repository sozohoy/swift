//
//  ViewController.swift
//  swiftPracetice2
//
//  Created by 한지석 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var textFields: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func buttonClicked(_ sender: Any) {
        var i = 0
        for textField in textFields {
            if i % 2 == 0{
                textField.text = "modu text"
            }
            i += 1
        }
    }
    
}

