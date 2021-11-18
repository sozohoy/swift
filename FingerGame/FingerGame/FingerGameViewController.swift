//
//  FingerGameViewController.swift
//  FingerGame
//
//  Created by 한지석 on 2021/11/16.
//

import UIKit

class FingerGameViewController: UIViewController {

    @IBOutlet weak var gameView: FingerGameView!
    @IBOutlet weak var secondsLabel: UILabel!
    
    var secondsLeft = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameView.controller = self
    }
    

    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var timer: Timer?
    
    func touchCountDidchange() {
        timer?.invalidate() // 터치가 바뀌면 기존의 타이머를 취소해달라는 뜻. 동그라미를 넣거나 뺄 때 터치가 바뀜.
        
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
            for roundview in self.gameView.touchToRoundView.values{
                var randomChoice = Bool.random()
                
                UIView.animate(withDuration: 1) {
                    if randomChoice {
                        roundview.backgroundColor = UIColor(named: "green")
                    } else {
                        roundview.backgroundColor = UIColor(named: "orange")
                    }
                    
                    let center = roundview.center
                    roundview.frame.size = CGSize(width: 120, height: 120)
                    roundview.layer.cornerRadius = 60
                    roundview.center = center
                }
               
            }
        }
        
        resetSecondsTimer()
    }
    
    var secondsTimer: Timer?
    func resetSecondsTimer() {
        secondsTimer?.invalidate()
        
        if gameView.touchToRoundView.count > 0 {
            
            self.secondsLeft = 5
            self.secondsLabel.text = "5"
            self.blinkSecondsLabel()
            
            secondsTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
                self.secondsLeft -= 1
                self.secondsLabel.text = "\(self.secondsLeft)"
                self.blinkSecondsLabel()
                
                if self.secondsLeft == 0 {
                    self.secondsLabel.text = ""
                    self.blinkSecondsLabel()
                    self.secondsTimer?.invalidate() // timer 멈춰
                }
            })
        } else {
            self.secondsLabel.text = ""
        }
        
        
    }

    func blinkSecondsLabel(){
        self.secondsLabel.alpha = 1
        
        UIView.animate(withDuration: 0.5) {
            self.secondsLabel.alpha = 0
        }
    }
}
