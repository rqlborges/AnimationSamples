//
//  MusicPlayerViewController.swift
//  AnimationSamples

//
//  Created by Erick Borges on 10/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class MusicPlayerFramework: UIViewController {
    
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
            shuffleButtonOutlet.move(to: CGPoint(x: 106, y: 582), damping: 0.75, duration: 0.35, delay: 0.025, options: .curveEaseIn)
            heartButtonOutlet.move(to: CGPoint(x: 170, y: 518), damping: 0.75, duration: 0.35, delay: 0.050, options: .curveEaseIn)
            repeatButtonOutlet.move(to: CGPoint(x: 234, y: 582), damping: 0.75, duration: 0.35, delay: 0.075, options: .curveEaseIn)
        } else {
            let moreButtonCenter = CGPoint(x: 170, y: 582)
            repeatButtonOutlet.move(to: moreButtonCenter, damping: 0.75, duration: 0.35, delay: 0.025, options: .curveEaseIn)
            heartButtonOutlet.move(to: moreButtonCenter, damping: 0.75, duration: 0.35, delay: 0.050, options: .curveEaseIn)
            shuffleButtonOutlet.move(to: moreButtonCenter, damping: 0.75, duration: 0.35, delay: 0.075, options: .curveEaseIn)
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
    
    @IBAction func previousTap(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


