//
//  UiButtonExtension.swift
//  iOS_Calculator
//
//  Created by Sergio López on 14/08/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import UIKit

extension UIButton {
    
    // Borde Redondo
    
        func round(){
            layer.cornerRadius = bounds.height / 2
            clipsToBounds = true
        }

    // Brillos

        func shine(){
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 0.5
        }) { (completion) in
            UIView.animate(withDuration: 0.1, animations: {
                self.alpha = 1
                })
            }
        }
}
