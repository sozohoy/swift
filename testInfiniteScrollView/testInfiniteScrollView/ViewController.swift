//
//  ViewController.swift
//  testInfiniteScrollView
//
//  Created by 한지석 on 2022/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblList: UITableView!
    var recordArray:[Int] = Array()
    var limit = 20
    let totalEnteries = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblList.dataSource = self
        tblList.delegate = self
        tblList.tableFooterView = UIView(frame: .zero)
        
        var index = 0
        while index < limit {
            recordArray.append(index)
            index = index + 1
        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "listcell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "listcell")
        }
        
        cell?.textLabel?.text = "Row \(recordArray[indexPath.row])"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

}
