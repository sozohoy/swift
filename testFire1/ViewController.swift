//
//  ViewController.swift
//  testFire1
//
//  Created by 한지석 on 2022/01/17.
//

import FirebaseDatabase
import UIKit

class ViewController: UIViewController {
    private let database = Database.database(url: "https://testfire1-55481-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData1()
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 50))
        button.setTitle("Add Entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
    }
    
    @objc private func addNewEntry() {
        let object: [String: Any] = [
            "name": "iOS Academy" as NSObject,
            "Youtube" : "yes"
        ]
        database.child("something").setValue(object)
    }
    
    func getData1(){
        
        database.child("0").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            let startTime = value?["startTime"] as? String ?? ""
            let professor = value?["professor"] as? String ?? ""
            print("\(startTime), \(professor)")
        })
            
    }


}

