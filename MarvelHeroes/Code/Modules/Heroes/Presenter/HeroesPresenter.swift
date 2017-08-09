//
//  HeroesPresenter.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol HeroesPresenterInterface {
    func getHeroes()
}

class HeroesPresenter {
    
    let interactor: HeroesInteractor
    let router: HeroesRouter
    weak var listView: ListViewController?
    weak var detailView: DetailViewController?
    var heroes: [Hero] = []
    var viewModels: [HeroCellViewModel] = []
    
    init(interactor: HeroesInteractor, router: HeroesRouter) {
        self.interactor = interactor
        self.router = router
    }
}

private extension HeroesPresenter {
    
    func createViewModels() {
        var viewModels: [HeroCellViewModel] = []
        for hero in heroes {
            
            guard let name = hero.name, let photo = hero.photo else {
                continue
            }
            
            let viewModel = HeroCellViewModel(name: name, photo: photo, selectionBlock: { [weak self] in
                self?.showDetailHero(hero: hero)
            })
            
            viewModels.append(viewModel)
        }
        
        self.viewModels = viewModels
    }
    
    func showDetailHero(hero: Hero) {
        
    }
}

extension HeroesPresenter: HeroesPresenterInterface {
    func getHeroes() {
        interactor.getHeroes()
    }
}

extension HeroesPresenter: HeroesInteractorOutputInteface {
    
    func onHeroes(heroes: [Hero]) {
        self.heroes = heroes
        createViewModels()
        listView?.reloadData()
    }
    
    func onFailure(error: String) {
        
    }
}

extension HeroesPresenter: Collectionable {
    func items() -> [Section : [HeroCellViewModel]]? {
        return [0: viewModels]
    }
}
