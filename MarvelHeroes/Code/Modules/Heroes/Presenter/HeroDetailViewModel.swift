//
//  HeroDetailViewModel.swift
//  MarvelHeroes
//
//  Created by José María Ila on 9/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

struct HeroDetailViewModel {
    let name: String
    let photo: String
    let realNameHeight: String
    let power: String
    let abilities: String
    let groups: String

    init(hero: Hero) {
        name = hero.name ?? ""
        photo = hero.photo ?? ""

        let realName = hero.realName ?? ""
        let height = hero.height ?? ""
        realNameHeight = "\(realName), \(height)"
        power = hero.power ?? ""
        abilities = hero.abilities ?? ""

        let _groups = hero.groups ?? ""
        let belongsTo = Strings.belongsTo.value
        groups = "\(belongsTo) \(_groups)"
    }
}
