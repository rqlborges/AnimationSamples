//
//  UIViewExtension.swift
//  AnimationSamples
//
//  Created by Erick Borges on 14/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

/**
 Edge of the view's superview, that may serve as reference to it's movements.
 - **none:** no edge
 - **top:** the top edge of the superview
 - **bottom:** the bottom edge of the superview
 - **left:** the left edge of the superview
 - **right:** the right edge of the superview
 
 */
public enum SuperviewEdge {
    case none
    case top
    case bottom
    case left
    case right
}

/**
 Determines the orientation of specific movements.
 - **horizontal:** horizontal orientation
 - **vertical:** vertical orientation
 */
public enum Direction {
    case horizonal
    case vertical
}

//MARK: - UIView Extension
/**
 A UIView extension created to make basic animations simple to design, to use and to implement.
 */
public extension UIView {
    
    //MARK: - FadeIn
    /**
     Fades the view in.
     
     - Parameters:
         - duration: Animation duration in seconds.
     
             Default value: **2**
     
         - delay: Animation start delay in seconds.
     
             Default value: **0**
     
         - options: Determines the animation curve.
     
             Default value: **.curveLinear**
     
         - completion: Completion handler. A block of code called right after the ending of the animation. Can be used to concatenate animations.
     
             Default value: **nill**
     
     - Returns: The UIView itself. It makes possible the chaining of similar methods. You can created combinations of animations that way. For example:
         ````
         view.move(to:).fadeOut().rotate()
         ````
         It will make the view move to a given CGPoint, fadeOut , and rotate 180 degrees at the same time.
     */
    @discardableResult func fadeIn(duration: TimeInterval = 2,
                                   delay: TimeInterval = 0,
                                   options: UIViewAnimationOptions = .curveLinear,
                                   completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 0
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: options, animations: {
                self.alpha = 1
        }, completion: completion)
        
        return self
    }
    
    //MARK: - FadeOut
    /**
     Fades the view in.
     
     - Parameters:
         - duration: Animation duration in seconds.
     
             Default value: **2**
     
         - delay: Animation start delay in seconds.
     
             Default value: **0**
     
         - options: Determines the animation curve.
     
             Default value: **.curveLinear**
     
         - completion: Completion handler. A block of code called right after the ending of the animation. Can be used to concatenate animations.
     
             Default value: **nill**
     
     - Returns: The UIView itself. It makes possible the chaining of similar methods. You can created combinations of animations that way. For example:
         ````
         view.move(to:).fadeOut().rotate()
         ````
         It will make the view move to a given CGPoint, fadeOut , and rotate 180 degrees at the same time.
     */
    @discardableResult func fadeOut(duration: TimeInterval = 2,
                                    delay: TimeInterval = 0,
                                    options: UIViewAnimationOptions = .curveLinear,
                                    completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 1
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: options, animations: {
                self.alpha = 0
        }, completion: completion)
        return self
    }
    
    //MARK: - PopIn
    /**
     Pops the view in.
     
     - Parameters:
         - fromScale: The initial scale of the pop in.
     
             Default value: **0.5**
     
         - damping:The damping ratio for the spring animation as it approaches its quiescent state.
     
             To smoothly decelerate the animation without oscillation, use a value of 1. Employ a damping ratio closer to zero to increase oscillation.
     
             Default value: **1.0**
     
         - velocity:The initial spring velocity. For smooth start to the animation, match this value to the view’s velocity as it was prior to attachment.
     
             A value of 1 corresponds to the total animation distance traversed in one second. For example, if the total animation distance is 200 points and you want the start of the animation to match a view velocity of 100 pt/s, use a value of 0.5.
     
             Default value: **0**
     
         - duration: Animation duration in seconds.
     
             Default value: **2**
     
         - delay: Animation start delay in seconds.
     
             Default value: **0**
     
         - options: Determines the animation curve.
     
             Default value: **.curveLinear**
     
         - completion: Completion handler. A block of code called right after the ending of the animation. Can be used to concatenate animations.
     
             Default value: **nill**
     
     - Returns: The UIView itself. It makes possible the chaining of similar methods. You can created combinations of animations that way. For example:
         ````
         view.move(to:).fadeOut().rotate()
         ````
         It will make the view move to a given CGPoint, fadeOut , and rotate 180 degrees at the same time.
     
     */
    @discardableResult func popIn(fromScale: CGFloat = 0.5,
                                  damping:CGFloat = 1.0,
                                  velocity:CGFloat = 0,
                                  duration: TimeInterval = 1.0,
                                  delay: TimeInterval = 0,
                                  options: UIViewAnimationOptions = .curveLinear,
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
    @discardableResult func popOut(toScale: CGFloat = 0.5,
                                   pulseScale: CGFloat = 1.1,
                                   duration: TimeInterval = 1.0,
                                   delay: TimeInterval = 0,
                                   completion: ((Bool) -> Void)? = nil) -> UIView {
        alpha = 1
        let prepareTransform = CGAffineTransform(scaleX: pulseScale, y: pulseScale)
        let endTransform = CGAffineTransform(scaleX: toScale, y: toScale)
        UIView.animateKeyframes(
            withDuration: duration, delay: delay, options: .calculationModeCubic, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.2, animations: {
                    self.transform = prepareTransform
                })
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.3, animations: {
                    self.transform = prepareTransform
                })
                UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5, animations: {
                    self.transform = endTransform
                    self.alpha = 0
                })
        }, completion: completion)
        
        return self
    }
    
    //MARK: - SlideIn
    //TODO: Description
    @discardableResult func slideIn(from edge: SuperviewEdge = .none,
                                    x: CGFloat = 0,
                                    y: CGFloat = 0,
                                    damping:CGFloat = 1.0,
                                    velocity:CGFloat = 0,
                                    duration: TimeInterval = 1.0,
                                    delay: TimeInterval = 0,
                                    options: UIViewAnimationOptions = .curveLinear,
                                    completion: ((Bool) -> Void)? = nil) -> UIView {
        let offset = offsetFor(edge: edge)
        transform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        isHidden = false
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity,
            options: options, animations: {
                self.transform = .identity
                self.alpha = 1
        }, completion: completion)
        return self
    }
    
    //MARK: - SlideOut
    //TODO: Description
    @discardableResult func slideOut(to edge: SuperviewEdge = .none,
                                     x: CGFloat = 0,
                                     y: CGFloat = 0,
                                     damping:CGFloat = 1.0,
                                     velocity:CGFloat = 0,
                                     duration: TimeInterval = 1.0,
                                     delay: TimeInterval = 0,
                                     options: UIViewAnimationOptions = .curveLinear,
                                     completion: ((Bool) -> Void)? = nil) -> UIView {
        var backwards = CGPoint(x: x, y: y)
        switch edge {
        case .bottom: backwards.y = -backwards.y
        case .right:  backwards.x = -backwards.x
        case .none:   backwards = CGPoint(x: 0, y: 0)
        case .top:    break
        case .left:   break
        }
        let offset = offsetFor(edge: edge)
        let prepareTransform = CGAffineTransform(translationX: backwards.x, y: backwards.y)
        var endTransform = CGAffineTransform(translationX: offset.x + x, y: offset.y + y)
        if (x != 0) || (y != 0){
            endTransform = CGAffineTransform(translationX: endTransform.tx - backwards.x, y: endTransform.ty - backwards.y)
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
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
            self.transform = endTransform
        }, completion: completion)
        return self
    }
    
    //TODO: - Finish Shake
    @discardableResult func shake (direction:Direction = .horizonal) -> UIView {
        let animation = CAKeyframeAnimation()
        animation.keyPath = (direction == .horizonal ? "position.x" : "position.y")
        animation.values = [0,5,0,-5,0]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.115
        animation.isAdditive = true
        animation.repeatCount = 5
        layer.add(animation, forKey: "shake")
        return self
    }
    
    //MARK: - Move(to:)
    //TODO: Description
    @discardableResult func move(to endPoint:CGPoint,
                                 damping:CGFloat = 1.0,
                                 velocity:CGFloat = 0,
                                 duration: TimeInterval = 1.0,
                                 delay: TimeInterval = 0,
                                 options: UIViewAnimationOptions = .curveLinear,
                                 completion: ((Bool) -> Void)? = nil) -> UIView {
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
            self.frame.origin = endPoint
        }, completion: completion)
        return self
    }
    
    //MARK: - Rotate
    //TODO: Save last angle
    @discardableResult func rotate(degrees angle:CGFloat = 180,
                                   damping:CGFloat = 1.0,
                                   velocity:CGFloat = 0,
                                   duration: TimeInterval = 1.0,
                                   delay: TimeInterval = 0,
                                   options: UIViewAnimationOptions = .curveLinear,
                                   completion: ((Bool) -> Void)? = nil) -> UIView {
        let angleInRadians = angle * .pi / 180
        let rotation = CGAffineTransform(rotationAngle: angleInRadians)
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
            self.transform = rotation
        }, completion: completion)
        return self
    }
    
    //MARK: - Scale
    //TODO: Descriptionm
    @discardableResult func scale(proportion:CGFloat = 1.3,
                                  damping:CGFloat = 1.0,
                                  velocity:CGFloat = 0,
                                  duration: TimeInterval = 1.0,
                                  delay: TimeInterval = 0,
                                  options: UIViewAnimationOptions = .curveLinear,
                                  completion: ((Bool) -> Void)? = nil) -> UIView {
        let endScale = CGAffineTransform(scaleX: proportion, y:proportion)
        UIView.animate(
            withDuration: duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: options, animations: {
            self.transform = endScale
        }, completion: completion)
        
        return self
    }
    
    //TODO: - Follow(path:)
    @discardableResult func follow(path: UIBezierPath ,
                                   duration: TimeInterval = 1,
                                   repeatCount: Float = 1,
                                   autoreverses: Bool = false) -> UIView {
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.path = path.cgPath
        animation.calculationMode = kCAAnimationLinear
        animation.duration = duration
        animation.autoreverses = autoreverses
        animation.repeatCount = repeatCount
        self.layer.add(animation, forKey: "followPath")
        return self
    }
    
    /**
     Calculate the offset for the given edge of the superview.
     - Parameters:
         - edge: A SuperviewEdge that represents the direction you want the view to translate.
     - Returns: A CGPoint that can set the view position outside of the superview.
     */
    private func offsetFor(edge: SuperviewEdge) -> CGPoint {
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


