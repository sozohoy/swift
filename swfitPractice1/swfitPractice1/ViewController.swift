//
//  ViewController.swift
//  swfitPractice1
//
//  Created by 한지석 on 2021/10/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var onOffswitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onOffSwitchValueChanged(_ sender: Any) {
        if self.onOffswitch.isOn {
            self.imageView.image = UIImage(named: "ace")
        } else {
            self.imageView.image = UIImage(named: "poker")
        }
    }
}

