//
//  AppDelegate.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRouter: MainRouter?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        mainRouter = MainRouter(window: window)
        mainRouter?.showRootViewController()
        
        AppAppearance.apply(window)
        
        self.window = window
        
        return true
    }
}

