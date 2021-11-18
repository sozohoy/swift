//
//  FingerGameView.swift
//  FingerGame
//
//  Created by 한지석 on 2021/11/16.
//

import UIKit

class FingerGameView: UIView {
    
    weak var controller: FingerGameViewController?
    
    var touchToRoundView: [UITouch: UIView] = [:]
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
            view.center = touch.location(in: self) // touch.location으로 센터를 바꿔주면 x,y가 알아서 바뀜
            view.backgroundColor = UIColor(named: "red")
            view.layer.cornerRadius = 40
            
            self.touchToRoundView[touch] = view
            self.addSubview(view)
            
            self.controller?.touchCountDidchange()
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            view?.center = touch.location(in: self)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            self.controller?.touchCountDidchange()
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            var view = self.touchToRoundView[touch]
            
            view?.removeFromSuperview()
            self.touchToRoundView.removeValue(forKey: touch)
            self.controller?.touchCountDidchange()
        }
    }
    
}
