//
//  SideBarButtonViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 17/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class SideBarButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sideBarButton()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func sideBarButton(){
        
        //Set positions
        let viewCenter = view.center
        
        let topLinePosition = CGPoint(x: viewCenter.x, y: view.center.y - 5)
        let topLineGoTo = CGPoint(x: viewCenter.x + 25, y: view.center.y - 5)
        
        let middleLinePosition = CGPoint(x: viewCenter.x, y: viewCenter.y)
        let middleLineGoTo = CGPoint(x: viewCenter.x + 25, y: view.center.y)
        
        let bottonLinePosition = CGPoint(x: viewCenter.x, y: viewCenter.y + 5)
        let bottonLineGoTo = CGPoint(x: viewCenter.x + 25, y: view.center.y + 5)
        
        //Set Paths
        let topLinePath = UIBezierPath()
        topLinePath.move(to: topLinePosition)
        topLinePath.addLine(to: topLineGoTo)
        
        let middleLinePath = UIBezierPath()
        middleLinePath.move(to: middleLinePosition)
        middleLinePath.addLine(to: middleLineGoTo)
        
        let bottonLinePath = UIBezierPath()
        bottonLinePath.move(to: bottonLinePosition)
        bottonLinePath.addLine(to: bottonLineGoTo)
        
        //Set Layers
        let topLineLayer = CAShapeLayer()
        topLineLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        topLineLayer.lineWidth = 3
        topLineLayer.path = topLinePath.cgPath
        self.view.layer.addSublayer(topLineLayer)
        
        let middleLineLayer = CAShapeLayer()
        middleLineLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        middleLineLayer.lineWidth = 3
        middleLineLayer.path = middleLinePath.cgPath
        self.view.layer.addSublayer(middleLineLayer)
        
        let bottonLineLayer = CAShapeLayer()
        bottonLineLayer.strokeColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        bottonLineLayer.lineWidth = 3
        bottonLineLayer.path = bottonLinePath.cgPath
        self.view.layer.addSublayer(bottonLineLayer)
        
        
        
        
    }
    
    @IBAction func animate(_ sender: Any) {
    }
    
    @IBAction func dismiss(_ sender: Any) {
    }
}
