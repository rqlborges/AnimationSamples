//
//  MusicPlayerViewController.swift
//  CoreAnimationTests
//
//  Created by Erick Borges on 10/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class MusicPlayerViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var moreButtonOutlet: UIButton!
    @IBOutlet weak var shuffleButtonOutlet: UIButton!
    @IBOutlet weak var heartButtonOutlet: UIButton!
    @IBOutlet weak var repeatButtonOutlet: UIButton!
    
    //MARK: - Atributes
    
    //MARK: - Life Cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // -- Setup
        
        //Selection
        moreButtonOutlet.isSelected = false
        shuffleButtonOutlet.isSelected = false
        heartButtonOutlet.isSelected = false
        repeatButtonOutlet.isSelected = false
        
        //Position
        let moreButtonCenter = CGPoint(x: 170, y: 582)
        shuffleButtonOutlet.frame.origin = moreButtonCenter
        heartButtonOutlet.frame.origin = moreButtonCenter
        repeatButtonOutlet.frame.origin = moreButtonCenter
        
    }
    
    //MARK: - Actions
    
    @IBAction func moreTap(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
        if sender.isSelected {
            UIView.animate(withDuration: 0.35, delay: 0.025, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.shuffleButtonOutlet.frame.origin = CGPoint(x: 106, y: 582)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.35, delay: 0.050, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.heartButtonOutlet.frame.origin = CGPoint(x: 170, y: 518)
            }, completion: nil)
            
            UIView.animate(withDuration: 0.35, delay: 0.075, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.repeatButtonOutlet.frame.origin = CGPoint(x: 234, y: 582)
            }, completion: nil)
        } else {
            let moreButtonCenter = CGPoint(x: 170, y: 582)
            
            UIView.animate(withDuration: 0.35, delay: 0.025, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.repeatButtonOutlet.frame.origin = moreButtonCenter
            }, completion: nil)
            
            UIView.animate(withDuration: 0.35, delay: 0.050, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.heartButtonOutlet.frame.origin = moreButtonCenter
            }, completion: nil)
            
            UIView.animate(withDuration: 0.35, delay: 0.075, usingSpringWithDamping: 0.75, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                self.shuffleButtonOutlet.frame.origin = moreButtonCenter
            }, completion: nil)
        }
    }
    
    @IBAction func shuffleTap(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
    }
    
    @IBAction func heartTap(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
    }
    
    @IBAction func repeatTap(_ sender: UIButton) {
        sender.isSelected = !(sender.isSelected)
        
    }
    
}
