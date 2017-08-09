//
//  HeroesRouter.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

class HeroesRouter {
    
    let mainRouter: MainRouterInterface
    weak var presenter: HeroesPresenter?
    
    init(mainRouter: MainRouterInterface) {
        self.mainRouter = mainRouter
    }
    
    func showHeroDetail() {
        
        guard let presenter = presenter else {
            return
        }
        
        let detailViewController = DetailViewController(presenter: presenter)
        mainRouter.show(viewController: detailViewController, sender: nil)
    }
}

extension HeroesRouter: RouterFactory {
    
    static func create(withMainRouter mainRouter: MainRouterInterface) -> UIViewController {
        let dataSource = HeroesDataSource()
        let repository = HeroesRepository(dataSource: dataSource)
        let interactor = HeroesInteractor(repository: repository)
        let router = HeroesRouter(mainRouter: mainRouter)
        let presenter = HeroesPresenter(interactor: interactor, router: router)
        let collectionViewCollectionable = AnyCollectionable(presenter)
        let view = ListViewController(presenter: presenter, collectionable: collectionViewCollectionable)
        
        repository.output = interactor
        interactor.output = presenter
        presenter.listView = view
        router.presenter = presenter
        
        return view
    }
}
