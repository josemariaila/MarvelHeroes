//
//  AppAppearance.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

struct AppColors {
    static let clear = UIColor.clear
    static let white = UIColor.white
    static let black = UIColor.black
    static let grayLight = UIColor.colorRGB(red: 202.0, green: 202.0, blue: 202.0)
    static let gray = UIColor.colorRGB(red: 108.0, green: 108.0, blue: 108.0)
    static let grayDark = UIColor.colorRGB(red: 51.0, green: 51.0, blue: 51.0)
}

struct Sizes {
    static var spacing0: CGFloat = 0.0
}

class AppAppearance {
    
    static func apply(_ window: UIWindow) {
        AppAppearance.applyWindowStyle(window)
        AppAppearance.applyNavigationBarStyle()
    }
}

private extension AppAppearance {
    
    static func applyWindowStyle(_ window: UIWindow) {
        window.backgroundColor = AppColors.white
        window.tintColor = AppColors.black
    }
    
    static func applyNavigationBarStyle() {
        let appearance = UINavigationBar.appearance()
        appearance.tintColor = AppColors.black
        appearance.barTintColor = AppColors.white
        appearance.isTranslucent = false
        appearance.isHidden = false
    }
}
