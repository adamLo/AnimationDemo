//
//  NextViewController.swift
//  animation
//
//  Created by Adam Lovastyik on 28/10/2018.
//  Copyright © 2018 ScreamingBox. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    // MARK: - Public properties
    
    var dismissBlock: (() -> ())?
    
    // MARK: - Controller lifecycle
    
    class func controller() -> NextViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        return controller
    }

    override func viewDidLoad() {
        
        super.viewDidLoad()

        title = "Next"
    }
    
    // MARK: - Actions
    
    @IBAction func dismissButtonTouched(_ sender: Any) {
        
        if let _dismiss = dismissBlock {
            
            _dismiss()
        }
        else {
            
            navigationController?.popViewController(animated: true)
        }
    }
    
}
