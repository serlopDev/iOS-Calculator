//
//  AppDelegate.swift
//  iOS_Calculator
//
//  Created by Sergio López on 12/08/2020.
//  Copyright © 2020 Sergio López. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Setup
        
        setupView()
        
        return true
    }
    
    // MARK: - Private Methods
    
    private func setupView(){
        
        // Instanciamos nuestro controlador Inicial
        
        let vc = HomeViewController()
        
        // Indicamos que será nuestra pantalla inicial y que esté visible
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }

}

