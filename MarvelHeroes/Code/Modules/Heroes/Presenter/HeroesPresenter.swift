//
//  HeroesPresenter.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

protocol HeroesPresenterInterface {
    var heroDetail: HeroDetailViewModel? { get }
    func getHeroes()
    func detailDidDisappear()
}

class HeroesPresenter {
    
    let interactor: HeroesInteractor
    let router: HeroesRouter
    weak var listView: ListViewController?
    weak var detailView: DetailViewController?
    var heroes: [Hero] = []
    var viewModels: [HeroCellViewModel] = []
    var heroSelected: Hero?
    
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
        heroSelected = hero
        router.showHeroDetail()
    }
}

extension HeroesPresenter: HeroesPresenterInterface {
    
    var heroDetail: HeroDetailViewModel? {
        
        guard let heroSelected = heroSelected else {
            return nil
        }
        
        return HeroDetailViewModel(hero: heroSelected)
    }
    
    func getHeroes() {
        if heroes.isEmpty {
            interactor.getHeroes()
        }
    }
    
    func detailDidDisappear() {
        heroSelected = nil
    }
}

extension HeroesPresenter: HeroesInteractorOutputInteface {
    
    func onHeroes(heroes: [Hero]) {
        self.heroes = heroes
        createViewModels()
        listView?.reloadData()
    }
    
    func onFailure(error: String) {
        listView?.presentAlertController(withMessage: error, completion: { [weak self] _ in
            self?.getHeroes()
        })
    }
}

extension HeroesPresenter: Collectionable {
    func items() -> [Section : [HeroCellViewModel]]? {
        return [0: viewModels]
    }
}
