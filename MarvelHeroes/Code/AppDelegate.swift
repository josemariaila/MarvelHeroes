//
//  AppDelegate.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var mainRouter: MainRouter?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        Fabric.with([Crashlytics.self])

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()

        mainRouter = MainRouter(window: window)
        mainRouter?.showRootViewController()

        MainRouter.apply(window)

        self.window = window

        return true
    }
}
