//
//  Superheroes.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation
import ObjectMapper

class Superheroes: NSObject, Mappable {
    
    var heroes: [Hero]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        heroes <- map["superheroes"]
    }
}
