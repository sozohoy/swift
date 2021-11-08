//
//  ChickenInputViewController.swift
//  FibonaChicken
//
//  Created by 한지석 on 2021/11/08.
//

import UIKit

class ChickenInputViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var resultButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func textEditingChanged(_ sender: Any) {
        var text = textField.text ?? ""
        stepper.value = Double(text) ?? 0
        
    } // 숫자가 늘어나게하는
 
    @IBAction func stepperValueChanged(_ sender: Any) {
        var value = stepper.value
        textField.text = String(Int(value))
    } // stepper로 데이터 계산
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if var controller = segue.destination as? ChickenOutputViewController {
            controller.numberOfPeople = Int(stepper.value)
        }
    }
}
