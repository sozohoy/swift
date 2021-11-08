//
//  coffeeInputViewController.swift
//  coffeeList
//
//  Created by 한지석 on 2021/11/08.
//

import UIKit

class coffeeInputViewController: UIViewController {

    @IBOutlet weak var ameTextfield: UITextField!
    @IBOutlet weak var mixTextfield: UITextField!
    @IBOutlet weak var latTextfield: UITextField!
    
    @IBOutlet weak var ameStepper: UIStepper!
    @IBOutlet weak var mixStepper: UIStepper!
    @IBOutlet weak var latStepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ameTextFieldChanged(_ sender: Any) {
        var text = ameTextfield.text ?? "1"
        ameStepper.value = Double(text) ?? 1
    } // 첫화면의 textfield 부분의 숫자를 바꿔줌
    

    @IBAction func mixTextFieldChanged(_ sender: Any) {
        var text = mixTextfield.text ?? "1"
        mixStepper.value = Double(text) ?? 1
    }
    
    @IBAction func latTextFieldChanged(_ sender: Any) {
        var text = latTextfield.text ?? "1"
        latStepper.value = Double(text) ?? 1
    }
    
    @IBAction func ameChanged(_ sender: Any) {
        ameTextfield.text = String(Int(ameStepper.value))
    }
    
    
    @IBAction func mixChanged(_ sender: Any) {
        mixTextfield.text = String(Int(mixStepper.value))
    }
    
    @IBAction func latChanged(_ sender: Any) {
        latTextfield.text = String(Int(latStepper.value))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var coffee = segue.destination as? coffeeOutputViewController {
            coffee.amec = Int(ameStepper.value)
            coffee.mixc = Int(mixStepper.value)
            coffee.latc = Int(latStepper.value)
        }
    }
    

}
