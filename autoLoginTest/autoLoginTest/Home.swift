//
//  Home.swift
//  autoLoginTest
//
//  Created by 한지석 on 2022/01/03.
//

import UIKit

class Home: UIViewController {

    @IBOutlet weak var myLabelText: UILabel!
    var userpass:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabelText.text = userpass
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
