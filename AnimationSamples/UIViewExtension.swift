//
//  UIViewExtension.swift
//  AnimationSamples
//
//  Created by Erick Borges on 14/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

//TODO: - Description
public enum ViewEdge {
    case none
    case top
    case bottom
    case left
    case right
}

public extension UIView {
    
    //MARK: - FadeIn
    //TODO: Description
    @discardableResult func fadeIn(duration: TimeInterval = 2,
                                   delay: TimeInterval = 0,
                                   options: UIViewAnimationOptions = .curveEaseOut,
                                   completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 0
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: options, animations: {
            self.alpha = 1
        }, completion: completion)
        
        return self
    }
    
    //MARK: - FadeOut
    //TODO: Description
    @discardableResult func fadeOut(duration: TimeInterval = 2,
                                    delay: TimeInterval = 0,
                                    options: UIViewAnimationOptions = .curveEaseOut,
                                    completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 1
        UIView.animate(withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: options, animations: {
            self.alpha = 0
        }, completion: completion)
        return self
    }
    
    //MARK: - PopIn
    //TODO: Description
    @discardableResult func popIn(fromScale: CGFloat = 0.5,
                                  damping:CGFloat = 1.0,
                                  velocity:CGFloat = 0,
                                  duration: TimeInterval = 1.0,
                                  delay: TimeInterval = 0,
                                  options: UIViewAnimationOptions = .curveEaseOut,
                                  completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 0
        transform = CGAffineTransform(scaleX: fromScale, y: fromScale)
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity,
            options: options, animations: {
                self.transform = .identity
                self.alpha = 1
        }, completion: completion)
        return self
    }
    
    //MARK: - PopOut
    //TODO: Description
    @discardableResult func popIn(toScale: CGFloat = 0.5,
                                  pulseScale: CGFloat = 1.1,
                                  duration: TimeInterval = 1.0,
                                  delay: TimeInterval = 0,
                                  completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 0
        let endTransform = CGAffineTransform(scaleX: toScale, y: toScale)
        let prepareTransform = CGAffineTransform(scaleX: pulseScale, y: pulseScale)
        
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                self.transform = prepareTransform
            })
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8, animations: {
                self.transform = endTransform
            })
            
        }, completion: completion)
        
        return self
    }
    
    //MARK: - SlideIn
    //TODO: Description
    @discardableResult func slideIn(from edge: ViewEdge = .none,
                                    x: CGFloat = 0,
                                    y: CGFloat = 0,
                                    damping:CGFloat = 1.0,
                                    velocity:CGFloat = 0,
                                    duration: TimeInterval = 1.0,
                                    delay: TimeInterval = 0,
                                    completion: ((Bool) -> Void)? = nil) -> UIView {
        let offset = offsetFor(edge: edge)
        transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        isHidden = false
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity,
            options: .curveEaseOut, animations: {
                self.transform = .identity
                self.alpha = 1
        }, completion: completion)
        return self
    }
    //TODO: SlideOut
    //TODO: Shake
    //TODO: Move(from:to:)
    //TODO: MoveTo(to:)
    //TODO: Rotate
    //TODO: Scale
    
    //TODO: - Description
    private func offsetFor(edge: ViewEdge) -> CGPoint {
        if let parentSize = self.superview?.frame.size {
            switch edge {
            case .none: return CGPoint.zero
            case .top: return CGPoint(x: 0, y: -frame.maxY)
            case .bottom: return CGPoint(x: 0, y: parentSize.height - frame.minY)
            case .left: return CGPoint(x: -frame.maxX, y: 0)
            case .right: return CGPoint(x: parentSize.width - frame.minX, y: 0)
            }
        }
        return .zero
    }
    
}


