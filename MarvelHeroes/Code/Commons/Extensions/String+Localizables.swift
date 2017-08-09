//
//  String+Localizables.swift
//  MarvelHeroes
//
//  Created by José María Ila on 9/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

enum Strings: String {
    
    case title
    
    var value: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
