//
//  MyViewController.swift
//  AnimationSamples
//
//  Created by Erick Borges on 14/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

private enum AnimationExampleType: String {
    case fadeIn = "fadeIn()"
    case fadeOut = "fadeOut()"
    case popIn = "popIn()"
    //    case popOut = "popOut()"
    //    case slideInFromTop = "slideIn(from: .top)"
    //    case slideInFromBottom = "slideIn(from: .bottom)"
    //    case slideInFromLeft = "slideIn(from: .left)"
    //    case slideInFromRight = "slideIn(from: .right)"
    //    case slideOutToTop = "slideOut(to: .top)"
    //    case slideOutToBottom = "slideOut(to: .bottom)"
    //    case slideOutToLeft = "slideOut(to: .left)"
    //    case slideOutToRight = "slideOut(to: .right)"
    //    case bounceInFromTop = "bounceIn(from: .top)"
    //    case bounceInFromBottom = "bounceIn(from: .bottom)"
    //    case bounceInFromLeft = "bounceIn(from: .left)"
    //    case bounceInFromRight = "bounceIn(from: .right)"
    //    case bounceOutToTop = "bounceOut(to: .top)"
    //    case bounceOutToBottom = "bounceOut(to: .bottom)"
    //    case bounceOutToLeft = "bounceOut(to: .left)"
    //    case bounceOutToRight = "bounceOut(to: .right)"
    //    case shake = "shake()"
    //    case shakeTowardLeft = "shake(toward: .left)"
    //    case shakeTowardTop = "shake(toward: .top)"
    //    case hop = "hop()"
    //    case hopTowardTop = "hop(toward: .top)"
    //    case hopTowardBottom = "hop(toward: .bottom)"
    //    case hopTowardLeft = "hop(toward: .left)"
    //    case hopTowardRight = "hop(toward: .right)"
}

private let AllExamples: [AnimationExampleType] = [
    .fadeIn,
    .fadeOut,
    .popIn,
    //    .popOut,
    //    .slideInFromTop,
    //    .slideInFromBottom,
    //    .slideInFromLeft,
    //    .slideInFromRight,
    //    .slideOutToTop,
    //    .slideOutToBottom,
    //    .slideOutToLeft,
    //    .slideOutToRight,
    //    .bounceInFromTop,
    //    .bounceInFromBottom,
    //    .bounceInFromLeft,
    //    .bounceInFromRight,
    //    .bounceOutToTop,
    //    .bounceOutToBottom,
    //    .bounceOutToLeft,
    //    .bounceOutToRight,
    //    .shake,
    //    .shakeTowardLeft,
    //    .shakeTowardTop,
    //    .hop,
    //    .hopTowardTop,
    //    .hopTowardBottom,
    //    .hopTowardLeft,
    //    .hopTowardRight,
]

class MyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typePicker.delegate = self
        typePicker.dataSource = self
        animatedView.layer.cornerRadius = 20
    }
    
    @IBAction func startButtonPressed(_ sender: AnyObject) {
        startAnimation(AllExamples[typePicker.selectedRow(inComponent: 0)])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ view: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return AllExamples.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.text = AllExamples[row].rawValue
        label.font = UIFont(name: "Courier", size: 15)
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }
    
    private func startAnimation(_ type: AnimationExampleType) {
        animatedView.transform = .identity
        switch (type) {
        case .fadeIn:
            animatedView.fadeIn()
        case .fadeOut:
            animatedView.fadeOut()
        case .popIn:
            animatedView.popIn()
            //        case .popOut:
            //            animatedView.alpha = 1
            //            animatedView.popOut()
            //        case .slideInFromTop:
            //            animatedView.slideIn(from: .top)
            //        case .slideInFromBottom:
            //            animatedView.slideIn(from: .bottom)
            //        case .slideInFromLeft:
            //            animatedView.slideIn(from: .left)
            //        case .slideInFromRight:
            //            animatedView.slideIn(from: .right)
            //        case .slideOutToTop:
            //            animatedView.alpha = 1
            //            animatedView.slideOut(to: .top)
            //        case .slideOutToBottom:
            //            animatedView.alpha = 1
            //            animatedView.slideOut(to: .bottom)
            //        case .slideOutToLeft:
            //            animatedView.alpha = 1
            //            animatedView.slideOut(to: .left)
            //        case .slideOutToRight:
            //            animatedView.alpha = 1
            //            animatedView.slideOut(to: .right)
            //        case .bounceInFromTop:
            //            animatedView.bounceIn(from: .top)
            //        case .bounceInFromBottom:
            //            animatedView.bounceIn(from: .bottom)
            //        case .bounceInFromLeft:
            //            animatedView.bounceIn(from: .left)
            //        case .bounceInFromRight:
            //            animatedView.bounceIn(from: .right)
            //        case .bounceOutToTop:
            //            animatedView.alpha = 1
            //            animatedView.bounceOut(to: .top)
            //        case .bounceOutToBottom:
            //            animatedView.alpha = 1
            //            animatedView.bounceOut(to: .bottom)
            //        case .bounceOutToLeft:
            //            animatedView.bounceOut(to: .left)
            //            animatedView.alpha = 1
            //        case .bounceOutToRight:
            //            animatedView.alpha = 1
            //            animatedView.bounceOut(to: .right)
            //        case .shake:
            //            animatedView.alpha = 1
            //            animatedView.shake()
            //        case .shakeTowardLeft:
            //            animatedView.alpha = 1
            //            animatedView.shake(toward: .left)
            //        case .shakeTowardTop:
            //            animatedView.alpha = 1
            //            animatedView.shake(toward: .top)
            //        case .hop:
            //            animatedView.alpha = 1
            //            animatedView.hop()
            //        case .hopTowardTop:
            //            animatedView.alpha = 1
            //            animatedView.hop(toward: .top)
            //        case .hopTowardBottom:
            //            animatedView.alpha = 1
            //            animatedView.hop(toward: .bottom)
            //        case .hopTowardLeft:
            //            animatedView.alpha = 1
            //            animatedView.hop(toward: .left)
            //        case .hopTowardRight:
            //            animatedView.alpha = 1
            //            animatedView.hop(toward: .right)
        }
    }
}
