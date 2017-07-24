//
//  FourBallsViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 19/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

public class FourBallsViewController: UIViewController {
    
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
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        circleSize = 20
        fourBallsPosition = CGPoint(x: view.center.x, y: view.center.y)
        fourBallsPositionX = fourBallsPosition.x
        fourBallsPositionY = fourBallsPosition.y
        
        fourBalls(circleSize: circleSize!, fourBallsPosition: fourBallsPosition, mainBallColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), topBallColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), rightBallColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), bottonBallColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), leftBallColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
        
//        self.view.fourBalls(circleSize: circleSize!, fourBallsPosition: fourBallsPosition, mainBallColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), topBallColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), rightBallColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), bottonBallColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), leftBallColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func fourBalls(circleSize: CGFloat, fourBallsPosition: CGPoint, mainBallColor: UIColor, topBallColor: UIColor, rightBallColor: UIColor, bottonBallColor: UIColor, leftBallColor: UIColor){
        
        let mainCircleCornerRadius = circleSize / 2
        let sideBallsSize = circleSize / 2
        let sideCirclesCornerRadius = sideBallsSize / 2
        
        
        
        //Set Circles
        mainCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: circleSize, height: circleSize))
        mainCircle.center = fourBallsPosition
        mainCircle.backgroundColor = mainBallColor
        mainCircle.layer.cornerRadius = mainCircleCornerRadius
        mainCircle.layer.zPosition = 0
        self.view.addSubview(mainCircle)
        
        topCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        topCircle.center = fourBallsPosition
        topCircle.backgroundColor = topBallColor
        topCircle.layer.cornerRadius = sideCirclesCornerRadius
        topCircle.layer.zPosition = -1
        self.view.addSubview(topCircle)
        
        rightCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        rightCircle.center = fourBallsPosition
        rightCircle.backgroundColor = rightBallColor
        rightCircle.layer.cornerRadius = sideCirclesCornerRadius
        rightCircle.layer.zPosition = -2
        self.view.addSubview(rightCircle)
        
        bottonCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        bottonCircle.center = fourBallsPosition
        bottonCircle.backgroundColor = bottonBallColor
        bottonCircle.layer.cornerRadius = sideCirclesCornerRadius
        bottonCircle.layer.zPosition = -3
        self.view.addSubview(bottonCircle)
        
        leftCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        leftCircle.center = fourBallsPosition
        leftCircle.backgroundColor = leftBallColor
        leftCircle.layer.cornerRadius = sideCirclesCornerRadius
        leftCircle.layer.zPosition = -4
        self.view.addSubview(leftCircle)
        
    }
    
    public func fourBallsAnimation(animationDuration: Double){
        
        UIView.animate(withDuration: animationDuration, delay: 0, animations: {
            self.topCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! - self.circleSize! - 5)
            
            self.rightCircle.center = CGPoint(x: self.fourBallsPositionX! + self.circleSize! + 5, y: self.fourBallsPositionY!)
            
            self.bottonCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! + self.circleSize! + 5)
            
            self.leftCircle.center = CGPoint(x: self.fourBallsPositionX! - self.circleSize! - 5, y: self.fourBallsPositionY!)
            
            self.mainCircle.frame.size = CGSize(width: self.mainCircle.frame.size.width / 2, height: self.mainCircle.frame.size.height / 2)
            self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
            self.mainCircle.layer.cornerRadius = self.mainCircle.frame.size.width / 2
        }, completion: { completion in
            UIView.animate(withDuration: animationDuration, delay: 0, animations: {
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
        fourBallsAnimation(animationDuration: 0.2)
    }
    
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

/*----------------------------------------------------------------------*/

public extension UIView{
    
    //Circles
    
    public func fourBalls(circleSize: CGFloat, fourBallsPosition: CGPoint, mainBallColor: UIColor, topBallColor: UIColor, rightBallColor: UIColor, bottonBallColor: UIColor, leftBallColor: UIColor){
        
        var mainCircle = UIView()
        var topCircle = UIView()
        var rightCircle = UIView()
        var bottonCircle = UIView()
        var leftCircle = UIView()
        
//        var circleSize: CGFloat!
//        var fourBallsPosition = CGPoint()
//        var fourBallsPositionX: CGFloat!
//        var fourBallsPositionY: CGFloat!
        
        let mainCircleCornerRadius = circleSize / 2
        let sideBallsSize = circleSize / 2
        let sideCirclesCornerRadius = sideBallsSize / 2
        
        
        
        //Set Circles
        mainCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: circleSize, height: circleSize))
        mainCircle.center = fourBallsPosition
        mainCircle.backgroundColor = mainBallColor
        mainCircle.layer.cornerRadius = mainCircleCornerRadius
        mainCircle.layer.zPosition = 0
        self.addSubview(mainCircle)
        
        topCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        topCircle.center = fourBallsPosition
        topCircle.backgroundColor = topBallColor
        topCircle.layer.cornerRadius = sideCirclesCornerRadius
        topCircle.layer.zPosition = -1
        self.addSubview(topCircle)
        
        rightCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        rightCircle.center = fourBallsPosition
        rightCircle.backgroundColor = rightBallColor
        rightCircle.layer.cornerRadius = sideCirclesCornerRadius
        rightCircle.layer.zPosition = -2
        self.addSubview(rightCircle)
        
        bottonCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        bottonCircle.center = fourBallsPosition
        bottonCircle.backgroundColor = bottonBallColor
        bottonCircle.layer.cornerRadius = sideCirclesCornerRadius
        bottonCircle.layer.zPosition = -3
        self.addSubview(bottonCircle)
        
        leftCircle = UIView(frame: CGRect(x: fourBallsPosition.x, y: fourBallsPosition.y, width: sideBallsSize, height: sideBallsSize))
        leftCircle.center = fourBallsPosition
        leftCircle.backgroundColor = leftBallColor
        leftCircle.layer.cornerRadius = sideCirclesCornerRadius
        leftCircle.layer.zPosition = -4
        self.addSubview(leftCircle)
        
    }
    
    
}
