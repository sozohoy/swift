//
//  MemoCommentViewController.swift
//  linkMemo
//
//  Created by 한지석 on 2021/11/10.
//

import UIKit
import Alamofire
import SwiftyJSON

class MemoCommentViewController: UIViewController {

    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        urlTextField.layer.cornerRadius = 10
        urlTextField.layer.borderWidth = 1
        urlTextField.layer.borderColor = UIColor.gray.cgColor
        urlTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        urlTextField.leftViewMode = .always
        
        commentTextField.layer.cornerRadius = 10
        commentTextField.layer.borderWidth = 1
        commentTextField.layer.borderColor = UIColor.gray.cgColor
        commentTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 0))
        commentTextField.leftViewMode = .always
        
    }
    
    

    @IBAction func doneButtonClicked(_ sender: Any) {
        
        
        var url = urlTextField.text ?? ""
        var comment = commentTextField.text ?? ""
        
        if url.count == 0 || comment.count == 0 {
            var alert = UIAlertController(title: "모두의 링크 메모장", message: "모두 입력해주세요 !", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        var parameter = [
            "url_give": url,
            "comment_give": comment
        ]
        
        AF.request("http://spartacodingclub.shop/post", method: .post, parameters: parameter).responseJSON { (response) in
            if var value = response.value {
                print(JSON(value))
            }
        }
        
        self.navigationController?.popViewController(animated: true)
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
