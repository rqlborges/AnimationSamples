//
//  FourBallsViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 19/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class FourBallsViewController: UIViewController {

    //Circles
    var mainCircle = UIView()
    var topCircle = UIView()
    var rightCircle = UIView()
    var bottonCircle = UIView()
    var leftCircle = UIView()

    var circleSize: CGFloat?
    var fourBallsPosition = CGPoint()
    var fourBallsPositionX: CGFloat?
    var fourBallsPositionY: CGFloat?
        
    
    //Go To Positions
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleSize = 20
        fourBallsPosition = CGPoint(x: view.center.x, y: view.center.y)
        fourBallsPositionX = fourBallsPosition.x
        fourBallsPositionY = fourBallsPosition.y
        
        fourBalls(circleSize: circleSize!, fourBallsPosition: fourBallsPosition)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fourBalls(circleSize: CGFloat, fourBallsPosition: CGPoint){
        
        let mainCircleCornerRadius = circleSize / 2
        let sideBallsSize = circleSize / 1.5
        let sideCirclesCornerRadius = sideBallsSize / 2
        
        
        
        //Set Circles
        mainCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: circleSize, height: circleSize))
        mainCircle.center = fourBallsPosition
        mainCircle.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        mainCircle.layer.cornerRadius = mainCircleCornerRadius
        mainCircle.layer.zPosition = 0
        self.view.addSubview(mainCircle)
        
        
        topCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        topCircle.center = fourBallsPosition
        topCircle.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        topCircle.layer.cornerRadius = sideCirclesCornerRadius
        topCircle.layer.zPosition = -1
        self.view.addSubview(topCircle)
        
        rightCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        rightCircle.center = fourBallsPosition
        rightCircle.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        rightCircle.layer.cornerRadius = sideCirclesCornerRadius
        rightCircle.layer.zPosition = -2
        self.view.addSubview(rightCircle)
        
        bottonCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        bottonCircle.center = fourBallsPosition
        bottonCircle.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        bottonCircle.layer.cornerRadius = sideCirclesCornerRadius
        bottonCircle.layer.zPosition = -3
        self.view.addSubview(bottonCircle)
        
        leftCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        leftCircle.center = fourBallsPosition
        leftCircle.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        leftCircle.layer.cornerRadius = sideCirclesCornerRadius
        leftCircle.layer.zPosition = -4
        self.view.addSubview(leftCircle)
        
    }
    
    func fourBallsAnimation(){
        
        UIView.animate(withDuration: 0.2, delay: 0, animations: {
            self.topCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! - self.circleSize! - 5)
            
            self.rightCircle.center = CGPoint(x: self.fourBallsPositionX! + self.circleSize! + 5, y: self.fourBallsPositionY!)
            
            self.bottonCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! + self.circleSize! + 5)
            
            self.leftCircle.center = CGPoint(x: self.fourBallsPositionX! - self.circleSize! - 5, y: self.fourBallsPositionY!)
            
            self.mainCircle.frame.size = CGSize(width: self.mainCircle.frame.size.width / 1.5, height: self.mainCircle.frame.size.height / 1.5)
            self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
            self.mainCircle.layer.cornerRadius = self.mainCircle.frame.size.width / 2
        }, completion: { completion in
            UIView.animate(withDuration: 0.2, delay: 0, animations: {
                self.topCircle.center = self.fourBallsPosition
                self.rightCircle.center = self.fourBallsPosition
                self.bottonCircle.center = self.fourBallsPosition
                self.leftCircle.center = self.fourBallsPosition
                
                self.mainCircle.frame.size = CGSize(width: self.circleSize!, height: self.circleSize!)
                self.mainCircle.center = self.fourBallsPosition
                self.mainCircle.layer.cornerRadius = self.circleSize! / 2
                
                
            }, completion: nil)
        })
        
    }
    
    @IBAction func fourBallAnimation(_ sender: Any) {
        fourBallsAnimation()
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
