//
//  HeroesInteractor.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol HeroesInteractorInputInterface {
    func getHeroes()
}

protocol HeroesInteractorOutputInteface: class {
    func onHeroes(heroes: [Hero])
    func onFailure(error: String)
}

class HeroesInteractor {
    
    let repository: HeroesRepository
    weak var output: HeroesInteractorOutputInteface?
    
    init(repository: HeroesRepository) {
        self.repository = repository
    }
}

extension HeroesInteractor: HeroesInteractorInputInterface {
    func getHeroes() {
        repository.getHeroes()
    }
}

extension HeroesInteractor: HeroesRepositoryOutputInterface {
    func onHeroesSuccess(heroes: [Hero]) {
        
    }
    
    func onHeroesFailure(error: Error) {
        
    }
}

