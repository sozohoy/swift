//
//  ViewController.swift
//  autoTest
//
//  Created by 한지석 on 2022/01/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var pwd: UITextField!
    @IBOutlet weak var btn: UIButton!
    
    let userid = "abcd"
    let userpwd = "135"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func clicked(_ sender: Any) {
        if userid == id.text! && userpwd == pwd.text!{
            UserDefaults.standard.set(id.text!, forKey: "email")
            let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
            navigationController?.pushViewController(vc!, animated: true)
            print("matched")
        } else{
            
        }
    }
    
}

