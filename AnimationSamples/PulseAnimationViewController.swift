//
//  PulseAnimationViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 16/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class PulseAnimationViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    let circleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulseAnimation(button: playButton, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pulseAnimation(button: UIButton, animationDuration: Double, repeatCount: Float, maxPulse: Double, maxOpacity: Double){
        //Pulse Animation
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = maxPulse
        pulseAnimation.duration = animationDuration
        pulseAnimation.repeatCount = repeatCount
        pulseAnimation.autoreverses = true
        button.layer.add(pulseAnimation, forKey: "addLayerAnimationScale")
        
        //Opacity Animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = maxOpacity
        opacityAnimation.duration = animationDuration
        opacityAnimation.repeatCount = repeatCount
        opacityAnimation.autoreverses = true
        button.layer.add(opacityAnimation, forKey: "addLayerAnimationOpacity")
    }
    
    @IBAction func animate(_ sender: Any) {
        pulseAnimation(button: playButton, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


