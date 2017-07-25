
//  CircleCheckViewController.swift
//  AnimationTest
//
//  Created by Heitor Ishihara on 11/07/17.
//  Copyright © 2017 Heitor Ishihara. All rights reserved.
//

import UIKit

class LoadingAnimationViewController: UIViewController {
    
    let circleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    public func circleCheck(circleCenter: CGPoint, circleRadius: CGFloat, circleColor: CGColor, circleWidth: CGFloat, clockwise: Bool, animationDuration: Double){
        
        circleLayer.removeFromSuperlayer()
        circleLayer.removeAllAnimations()
        
        //Circle Path
        let circlePath = UIBezierPath()
        circlePath.addArc(withCenter: view.center , radius: circleRadius, startAngle: 0, endAngle: .pi * 2, clockwise: clockwise)
        
        //Circle Layer
        circleLayer.fillColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0).cgColor
        circleLayer.strokeColor = circleColor
        circleLayer.lineWidth = circleWidth
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeEnd = 1
        circleLayer.strokeStart = 0
        
        
        //Add Circle
        self.view.layer.addSublayer(circleLayer)
        
        //Add Circle Animation
        
        CATransaction.begin()
        CATransaction.setCompletionBlock ({
            
            //Recursão
            CATransaction.begin()
            CATransaction.setCompletionBlock({
                self.circleLayer.removeAllAnimations()
                self.circleLayer.removeFromSuperlayer()
                self.circleCheck(circleCenter: circleCenter, circleRadius: circleRadius, circleColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor, circleWidth: 2, clockwise: clockwise, animationDuration: animationDuration)
            })
            
            //Erase Animation
            self.circleLayer.strokeStart = 1
            let circleEraseAnimation = CABasicAnimation(keyPath: "strokeStart")
            circleEraseAnimation.fromValue = 0
            circleEraseAnimation.toValue = 1
            circleEraseAnimation.duration = 0.7
            self.circleLayer.add(circleEraseAnimation, forKey: "erase")
            CATransaction.commit()
            
            
        })
        
        //Draw Animation
        let circleDrawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circleDrawAnimation.fromValue = 0
        
        circleDrawAnimation.toValue = 1
        circleDrawAnimation.duration = 0.7
        circleLayer.add(circleDrawAnimation, forKey: "draw")
        CATransaction.commit()
        
    }
    
    @IBAction func animate(_ sender: Any) {
        circleLayer.removeFromSuperlayer()
        self.circleCheck(circleCenter: self.view.center, circleRadius: 20, circleColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1).cgColor, circleWidth: 2, clockwise: true, animationDuration: 0.5)
    }
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


