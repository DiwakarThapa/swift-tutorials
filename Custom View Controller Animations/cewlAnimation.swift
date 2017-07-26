//
//  cewlAnimation.swift
//  AnimationStation
//
//  Created by Laurie Gray on 26/07/2017.
//  Copyright © 2017 Young Glasgow Talent. All rights reserved.
//

import UIKit

class CewlAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    // duration
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    // animate
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        
    
        let originalView = transitionContext.view(forKey: .from)!
        
        toView?.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        //toView?.center = originalView.center
        
        containerView.addSubview(toView!)
        containerView.bringSubview(toFront: toView!)
        
        UIView.animate(withDuration: 1.0, animations: {
            toView?.transform = .identity
        })
        
        transitionContext.completeTransition(true)
    }
}
