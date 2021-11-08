//
//  ChickenOutputViewController.swift
//  FibonaChicken
//
//  Created by 한지석 on 2021/11/08.
//

import UIKit

class ChickenOutputViewController: UIViewController {

    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var chickenLabel: UILabel!
    
    var numberOfPeople: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        peopleLabel.text = "\(numberOfPeople)명이서\n먹는다면.."
        chickenLabel.text = "\(calculateChicken())개를 시키거라.."
        // Do any additional setup after loading the view.
    }
    
    func calculateChicken() -> Int {
        var peopleDivided = Double(numberOfPeople) / 1.618
        var chicken = round(peopleDivided)
        
        return Int(chicken)
    }
   

}
