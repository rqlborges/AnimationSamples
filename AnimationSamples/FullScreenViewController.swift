//
//  FullScreenViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 24/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    var myView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 80, height: 80))
        myView.center = view.center
        myView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        myView.layer.cornerRadius = 10
        myView.isUserInteractionEnabled = true
        self.view.addSubview(myView)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchPoint = touch.location(in: self.view)
            
            if(myView.frame.contains(touchPoint)){
                self.myView.makeViewFullScreen(mainView: self.view, duration: 1)
            }
        }
    }
    
    @IBAction func animation(_ sender: Any) {
//        myView.makeViewFullScreen(_sender: self.myView, mainView: self.view, duration: 1)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//Extension Code
public extension UIView{
    
    public func makeViewFullScreen(mainView: UIView, duration: Double){
    
        //Initial desire view configuration
        let myViewSize = self.frame.size
        let myViewCenter = self.center
        
        
        if self.frame.size == myViewSize {
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                print("aumenta view")
                self.frame.size = mainView.frame.size
                self.center = mainView.center
            }, completion: nil)
            
        } else {
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                
                print("diminui view")
                self.frame.size = myViewSize
                self.center = myViewCenter
            }, completion: nil)
        }
    }
    
}




















