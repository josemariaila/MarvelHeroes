//
//  Constants.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation
import UIKit

struct AppColors {
    static let clear = UIColor.clear
    static let white = UIColor.white
    static let black = UIColor.black
    static let gray = UIColor.colorRGB(red: 108.0, green: 108.0, blue: 108.0)
    static let grayDark = UIColor.colorRGB(red: 51.0, green: 51.0, blue: 51.0)
    private init() {}
}

struct MarvelAPI {
    static let heroesList: String = "https://api.myjson.com/bins/bvyob"
    private init() {}
}

struct Sizes {
    static let spacing0: CGFloat = 0.0
    static let spacing10: CGFloat = 10.0
    static let spacing20: CGFloat = 20.0
    static let spacing30: CGFloat = 30.0
    static let size250: CGFloat = 250.0
    private init() {}
}
