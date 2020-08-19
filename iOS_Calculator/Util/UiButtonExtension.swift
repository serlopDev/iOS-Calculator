//
//  UiButtonExtension.swift
//  iOS_Calculator
//
//  Created by Sergio López on 14/08/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import UIKit

    private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

extension UIButton {
    
    // Colores
    

    
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
    
    // Cambiar apariencia del botón si se selecciona
    
        func selectOperation(selected: Bool){
        
        // Invertimos los colores
        
        backgroundColor = selected ? .white : orange
        setTitleColor(selected ? orange : .white, for: .normal)
        
    }
}
