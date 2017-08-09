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
    
    lazy var collectionView: UICollectionView = {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: {
            let layout = UICollectionViewFlowLayout()
            return layout
        }())
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = AppColors.clear
        collectionView.register(HeroCollectionViewCell.self)
        return collectionView
    }()
    
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
        
        title = Strings.title.value
        
        view.backgroundColor = AppColors.black
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getHeroes()
    }
}

extension ListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewCollectionable.numberOfRows(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel: HeroCellViewModel? = collectionViewCollectionable.viewModelForRowAtIndexPath(indexPath: indexPath)
        let cell: HeroCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.configure(viewModel: viewModel)
        return cell
    }
}

extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        collectionViewCollectionable.rowSelectedAtIndexPath(indexPath: indexPath)
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width / 2.0
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Sizes.spacing0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Sizes.spacing0
    }
    
}

extension ListViewController: ListViewInterface {
    
    func reloadData() {
        collectionView.reloadData()
    }
}
