//
//  SideBarButtonViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 17/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class SideBarButtonViewController: UIViewController {
    
    //Positions
    var viewCenter: CGPoint!
    var topLinePosition: CGPoint!
    var middleLinePosition: CGPoint!
    var bottonLinePosition: CGPoint!
    
    //Views
    var topLineView = UIView()
    var middleLineView = UIView()
    var bottonLineView = UIView()
    
    //Controls how the sidebar status
    var isSideBarOpen = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sideBarButton()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func sideBarButton(){
        
        //Positions
        viewCenter = self.view.center
        topLinePosition = CGPoint(x: viewCenter.x, y: view.center.y - 8)
        middleLinePosition = CGPoint(x: viewCenter.x, y: viewCenter.y)
        bottonLinePosition = CGPoint(x: viewCenter.x, y: viewCenter.y + 8)

        //Set Views
        topLineView = UIView(frame: CGRect(x: topLinePosition.x, y: topLinePosition.y, width: 25, height: 3))
        topLineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(topLineView)
        
        middleLineView = UIView(frame: CGRect(x: middleLinePosition.x, y: middleLinePosition.y, width: 25, height: 3))
        middleLineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        middleLineView.isUserInteractionEnabled = true
        self.view.addSubview(middleLineView)
        
        bottonLineView = UIView(frame: CGRect(x: bottonLinePosition.x, y: bottonLinePosition.y, width: 25, height: 3))
        bottonLineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.view.addSubview(bottonLineView)

    }
    
    
    func sideBarButtonAnimation(){
        //Set Animations
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            
            if(!self.isSideBarOpen){
                self.topLineView.frame.origin = self.middleLinePosition
                self.bottonLineView.frame.origin = self.middleLinePosition
                
                self.isSideBarOpen = true
            } else{
                self.topLineView.frame.origin = self.topLinePosition
                self.bottonLineView.frame.origin = self.bottonLinePosition
                
                self.isSideBarOpen = false
            }
        }, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sideBarButtonAnimation()
    }
    
    
    
    @IBAction func animate(_ sender: Any) {
        sideBarButtonAnimation()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
