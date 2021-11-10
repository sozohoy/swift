//
//  ReviewTableViewController.swift
//  BookReview
//
//  Created by 한지석 on 2021/11/10.
//

import UIKit
import SwiftyJSON
import Alamofire

class ReviewTableViewController: UITableViewController {
    
    var reviews: [JSON] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // 상속받은 클래스의 viewwillAppear를 호출
        
        AF.request("http://spartacodingclub.shop/review").responseJSON { (response) in
            if var value = response.value {
                var json = JSON(response.value)
                self.reviews = json["reviews"].arrayValue
                self.tableView.reloadData() // table view를 새로고침 하는 방법(외우자)
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // 섹션 개수는 1개
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count // 섹션 로우의 개수 = 리뷰의 개수
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) // ReviewCell 자리 수정(탬플릿 이름을 가져오는 느낌)

        // Configure the cell...
        var review = reviews[indexPath.row] // 몇번째 로우를 indexPath가 가지고 있음
        cell.textLabel?.text = "\(review["author"].stringValue) - \(review["title"].stringValue)"
        cell.detailTextLabel?.text = review["review"].stringValue // 위에는 두개의 값을 -로 묶어주기 위해 구분
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
