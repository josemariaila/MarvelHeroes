//
//  HeroesRepository.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol HeroesRepositoryInputInterface {
    func getHeroes()
}

protocol HeroesRepositoryOutputInterface: class {
    func onHeroesSuccess(heroes: [Hero])
    func onHeroesFailure(error: Error)
}

class HeroesRepository {
    let dataSource: HeroesDataSource
    weak var output: HeroesRepositoryOutputInterface?
    
    init(dataSource: HeroesDataSource) {
        self.dataSource = dataSource
    }
}

extension HeroesRepository: HeroesRepositoryInputInterface {
    func getHeroes() {
        dataSource.getHeroes(success: { [weak self] superheroes in
            guard let heroes = superheroes.heroes else {
                return
            }
            self?.output?.onHeroesSuccess(heroes: heroes)
            
        }, failure: { [weak self] error in
            self?.output?.onHeroesFailure(error: error)
        })
    }
}
