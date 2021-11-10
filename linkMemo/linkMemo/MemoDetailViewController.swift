//
//  MemoDetailViewController.swift
//  linkMemo
//
//  Created by 한지석 on 2021/11/10.
//

import UIKit
import SwiftyJSON

class MemoDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var commentTextView: UITextView!
    
    var memo: JSON!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.sd_setImage(with: URL(string: memo["image"].stringValue), completed: nil)
        contentTextView.text = memo["desc"].stringValue
        commentTextView.text = memo["comment"].stringValue
        self.title = memo["title"].stringValue
        
    }
    

    @IBAction func linkButtonClicked(_ sender: Any) {
        var url = URL(string: memo["url"].stringValue)
        
        UIApplication.shared.open((url!), options: [:], completionHandler: nil)
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
