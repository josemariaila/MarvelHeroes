//
//  Hero.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation
import ObjectMapper

class Hero: NSObject, Mappable {
    
    var name: String?
    var photo: String?
    var realName: String?
    var height: String?
    var power: String?
    var abilities: String?
    var groups: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        photo <- map["photo"]
        realName <- map["realName"]
        height <- map["height"]
        power <- map["power"]
        abilities <- map["abilities"]
        groups <- map["groups"]
    }
}
