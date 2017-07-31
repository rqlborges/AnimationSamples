//
//  FourBalls.swift
//  AnimationKit
//
//  Created by Heitor Ishihara on 25/07/17.
//  Copyright © 2017 Heitor Ishihara. All rights reserved.
//

import UIKit

class FourBalls: UIView {
    
    //Circles
    var mainCircle = UIView()
    var topCircle = UIView()
    var rightCircle = UIView()
    var bottonCircle = UIView()
    var leftCircle = UIView()
    
    var circleSize: CGFloat?
    var mainCircleCornerRadius: CGFloat?
    
    var fourBallsPosition = CGPoint()
    var fourBallsPositionX: CGFloat?
    var fourBallsPositionY: CGFloat?
    
    var calledDrawFourBalls = false
    
    
    public func drawFourBalls(mainView: UIView, circleSize: CGFloat, fourBallsPosition: CGPoint, mainBallColor: UIColor, topBallColor: UIColor, rightBallColor: UIColor, bottonBallColor: UIColor, leftBallColor: UIColor){
        
        let sideBallsSize = circleSize / 2
        let sideCirclesCornerRadius = sideBallsSize / 2
        
        //Set Attributes
        self.circleSize = circleSize
        self.mainCircleCornerRadius = circleSize / 2
        self.fourBallsPosition = fourBallsPosition
        self.fourBallsPositionX = fourBallsPosition.x
        self.fourBallsPositionY = fourBallsPosition.y
        
        //Set Circles
        mainCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: circleSize, height: circleSize))
        mainCircle.center = fourBallsPosition
        mainCircle.backgroundColor = mainBallColor
        mainCircle.layer.cornerRadius = mainCircleCornerRadius!
        mainCircle.layer.zPosition = 0
        mainView.addSubview(mainCircle)
        
        topCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        topCircle.center = fourBallsPosition
        topCircle.backgroundColor = topBallColor
        topCircle.layer.cornerRadius = sideCirclesCornerRadius
        topCircle.layer.zPosition = -1
        mainView.addSubview(topCircle)
        
        rightCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        rightCircle.center = fourBallsPosition
        rightCircle.backgroundColor = rightBallColor
        rightCircle.layer.cornerRadius = sideCirclesCornerRadius
        rightCircle.layer.zPosition = -2
        mainView.addSubview(rightCircle)
        
        bottonCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        bottonCircle.center = fourBallsPosition
        bottonCircle.backgroundColor = bottonBallColor
        bottonCircle.layer.cornerRadius = sideCirclesCornerRadius
        bottonCircle.layer.zPosition = -3
        mainView.addSubview(bottonCircle)
        
        leftCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        leftCircle.center = fourBallsPosition
        leftCircle.backgroundColor = leftBallColor
        leftCircle.layer.cornerRadius = sideCirclesCornerRadius
        leftCircle.layer.zPosition = -4
        mainView.addSubview(leftCircle)
        
        self.calledDrawFourBalls = true
        
    }
    
    public func fourBallsAnimation(animationDuration: Double){
        
        if(calledDrawFourBalls){
            
            
            UIView.animate(withDuration: animationDuration, delay: 0, animations: {
                self.topCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! - self.circleSize! - 5)
                
                self.rightCircle.center = CGPoint(x: self.fourBallsPositionX! + self.circleSize! + 5, y: self.fourBallsPositionY!)
                
                self.bottonCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! + self.circleSize! + 5)
                
                self.leftCircle.center = CGPoint(x: self.fourBallsPositionX! - self.circleSize! - 5, y: self.fourBallsPositionY!)
                
                self.mainCircle.frame.size = CGSize(width: self.mainCircle.frame.size.width / 2, height: self.mainCircle.frame.size.height / 2)
                self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
                self.mainCircle.layer.cornerRadius = self.mainCircleCornerRadius! / 2
                
            }, completion: { completion in
                UIView.animate(withDuration: animationDuration, delay: 0, animations: {
                    self.topCircle.center = self.fourBallsPosition
                    self.rightCircle.center = self.fourBallsPosition
                    self.bottonCircle.center = self.fourBallsPosition
                    self.leftCircle.center = self.fourBallsPosition
                    
                    self.mainCircle.frame.size = CGSize(width: self.circleSize!, height: self.circleSize!)
                    self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
                    self.mainCircle.layer.cornerRadius = self.mainCircleCornerRadius!
                    
                    
                }, completion: nil)
            })
            
        }
    }
    
}

