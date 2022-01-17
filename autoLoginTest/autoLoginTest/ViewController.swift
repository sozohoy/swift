//
//  ViewController.swift
//  autoLoginTest
//
//  Created by 한지석 on 2022/01/03.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let loginDetails = UserDefaults.standard.value(forKey: "username")
        if loginDetails != nil{
            nameField.text = UserDefaults.standard.value(forKey: "username") as? String
            pwdField.text = UserDefaults.standard.value(forKey: "password") as? String
        }
    }

    @IBAction func btnClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Saving", message: "저장할까요?", preferredStyle: .alert)
        let yesbutton=UIAlertAction(title: "Yes", style: .default) { (action) in
            UserDefaults.standard.set(self.nameField.text!,forKey: "username")
            UserDefaults.standard.set(self.pwdField.text!,forKey: "password")
            self.performSegue(withIdentifier: "segue1", sender: self)
            
            
        }
        let nobutton = UIAlertAction(title: "No", style: .default) { (action) in
            print("YOu have nothin")
            self.performSegue(withIdentifier: "segue1", sender: self)

        }
        alert.addAction(yesbutton)
        alert.addAction(nobutton)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue1"{
            let desVC = segue.destination as! Home
            desVC.userpass = "Hello \(nameField.text!)"
             
        }
    }
}

