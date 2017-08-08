//
//  ListViewController.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

protocol ListViewInterface {
    func reloadData()
}

class ListViewController: UIViewController {
    
    let presenter: HeroesPresenter
    let collectionViewCollectionable: AnyCollectionable<HeroCellViewModel>
    
    init(presenter: HeroesPresenter, collectionable: AnyCollectionable<HeroCellViewModel>) {
        self.presenter = presenter
        self.collectionViewCollectionable = collectionable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ListViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getHeroes()
    }
}

extension ListViewController: ListViewInterface {
    func reloadData() {
        
    }
}
