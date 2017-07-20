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
    case popOut = "popOut()"
    case slideInFromTop = "slideIn(from: .top)"
    case slideInFromBottom = "slideIn(from: .bottom)"
    case slideInFromLeft = "slideIn(from: .left)"
    case slideInFromRight = "slideIn(from: .right)"
    case slideOutToTop = "slideOut(to: .top)"
    case slideOutToBottom = "slideOut(to: .bottom)"
    case slideOutToLeft = "slideOut(to: .left)"
    case slideOutToRight = "slideOut(to: .right)"
    case shake = "shake()"
    case shakeHorizontal = "shake(direction: .horizontal)"
    case shakeVertical = "shake(direction: .vertical)"
    case move = "move(to:)"
    case rotate = "rotate(rotationAngle:)"
    case moveAndRotate = "move(to:).rotate(rotationAngle:)"
    case scale = "scale(proportion:)"
    case follow = "follow(path:)"
}

private let AllExamples: [AnimationExampleType] = [
    .fadeIn,
    .fadeOut,
    .popIn,
    .popOut,
    .slideInFromTop,
    .slideInFromBottom,
    .slideInFromLeft,
    .slideInFromRight,
    .slideOutToTop,
    .slideOutToBottom,
    .slideOutToLeft,
    .slideOutToRight,
    .shake,
    .shakeHorizontal,
    .shakeVertical,
    .move,
    .rotate,
    .moveAndRotate,
    .scale,
    .follow
]

class MyViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var typePicker: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    
    let origin = CGPoint(x: 137, y: 150)
    
    
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
        case .popOut:
            animatedView.popOut()
        case .slideInFromTop:
            animatedView.slideIn(from: .top)
        case .slideInFromBottom:
            animatedView.slideIn(from: .bottom)
        case .slideInFromLeft:
            animatedView.slideIn(from: .left)
        case .slideInFromRight:
            animatedView.slideIn(from: .right)
        case .slideOutToTop:
            animatedView.slideOut(to: .top, y: 100)
        case .slideOutToBottom:
            animatedView.slideOut(to: .bottom, y: 100)
        case .slideOutToLeft:
            animatedView.slideOut(to: .left, x: 100)
        case .slideOutToRight:
            animatedView.slideOut(to: .right, x: 100)
        case .shake:
            animatedView.shake()
        case .shakeHorizontal:
            animatedView.shake(direction: .horizonal)
        case .shakeVertical:
            animatedView.shake(direction: .vertical)
        case .move:
            animatedView.move(to:CGPoint(x: 0, y: origin.y), completion: { (success) in
                self.animatedView.move(to: self.origin, duration: 0, delay: 2)
            })
        case .rotate:
            animatedView.rotate()
        case .moveAndRotate:
            animatedView.move(to:CGPoint(x: 0, y: origin.y)).rotate(completion: { (success) in
                self.animatedView.move(to: self.origin, duration: 0, delay: 2)
            })
        case .scale:
            animatedView.scale()
        case .follow:
            
            let circle = UIBezierPath()
            circle.addArc(withCenter: CGPoint(x: 187, y: 200 ), radius: 50, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
            animatedView.follow(path: circle, duration: 2, repeatCount: 3)
        }
    }
}
