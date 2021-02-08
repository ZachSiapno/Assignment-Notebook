//
//  AnimationVC.swift
//  AssignmentNotebook (NEW)
//
//  Created by  on 12/13/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class AnimationVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func handleTapAnimations(_ sender: UITapGestureRecognizer) {
        print("Animating")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            // This translates it the titleLabel to the left or right, depending on the integer value set to "translationX:" and "y:"
            self.titleLabel.transform = CGAffineTransform(translationX: -75, y: 0)
        }) { (_) in
            
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.titleLabel.alpha = 0
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -150)
            })
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            self.bodyLabel.transform = CGAffineTransform(translationX: -75, y: 0)
        }) { (_) in
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                self.bodyLabel.alpha = 0
                self.bodyLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -150)
                
            }, completion: { (_) in
                self.performSegue(withIdentifier: "introSegue", sender: self)
            })
        }
        
    }
    

}
