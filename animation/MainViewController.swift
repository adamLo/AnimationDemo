//
//  MainViewController.swift
//  animation
//
//  Created by Adam Lovastyik on 28/10/2018.
//  Copyright © 2018 ScreamingBox. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var fallingButtonTop: NSLayoutConstraint!
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        title = "Main"
    }

    // MARK: - Actions
    
    @IBAction func fallingButtonTouched(_ sender: Any) {
        
        animateFallingButton()
    }
    
    @IBAction func slideUpButtonTouched(_ sender: Any) {
        
        animateSlideup()
    }
    
    @IBAction func flyAnimationButtonTouched(_ sender: Any) {
        
        animateFlyingView()
    }
    
    // MARK: - Animations
    
    private func animateFallingButton() {
        
        fallingButtonTop.constant = view.bounds.size.height
        
        UIView.animate(withDuration: 1.0, animations: {
            
            self.view.layoutIfNeeded()
            
        }) { (finished) in
            
            // Move back to original position
            self.fallingButtonTop.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func animateFlyingView() {
        
        var frame = CGRect(x: 0, y: 100, width: 20, height: 20)
        
        // Create view
        let flyingView = UIView(frame: frame)
        flyingView.backgroundColor = UIColor.red
        view.addSubview(flyingView)
        
        // Animate
        frame.origin.x = view.bounds.size.width
        UIView.animate(withDuration: 1.0, animations: {
            
            // Animate position
            flyingView.frame = frame
            
        }) { (finished) in
            
            // Get rid of it
            flyingView.removeFromSuperview()
        }
    }
    
    private func animateSlideup() {
        
        let controller = NextViewController.controller()
        
        controller.dismissBlock = { () in
            
            var frame = controller.view.frame
            frame.origin.y = self.view.bounds.size.height
            
            controller.willMove(toParent: nil)
            
            UIView.animate(withDuration: 1.0, animations: {
                
                controller.view.frame = frame
                
            }, completion: { (finished) in
                
                controller.view.removeFromSuperview()
                controller.removeFromParent()
                controller.didMove(toParent: nil)
            })
        }
        
        var frame = CGRect(x: 0, y: view.bounds.size.height, width: view.bounds.size.width, height: view.bounds.size.height)
        controller.view.frame = frame
        
        controller.willMove(toParent: self)
        view.addSubview(controller.view)
        addChild(controller)
        
        frame.origin.y = 0
        
        UIView.animate(withDuration: 1.0, animations: {
            
            controller.view.frame = frame
            
        }) { (finished) in
            
            controller.didMove(toParent: self)
        }
        
    }
}

