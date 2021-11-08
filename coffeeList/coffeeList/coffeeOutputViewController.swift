//
//  coffeeOutputViewController.swift
//  coffeeList
//
//  Created by 한지석 on 2021/11/08.
//

import UIKit

class coffeeOutputViewController: UIViewController {
    
    @IBOutlet weak var costLabel: UILabel!
    
    var amec: Int = 0
    var mixc: Int = 0
    var latc: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.costLabel.text = "총 \(costCoffee())원 입니다."
        // Do any additional setup after loading the view.
    }
    

    func costCoffee() -> Int {
        var ameCost = Int(amec) * 3000
        var mixCost = Int(mixc) * 2000
        var latCost = Int(latc) * 3500
        var allCost = ameCost + mixCost + latCost
        
        return Int(allCost)
    }

}
