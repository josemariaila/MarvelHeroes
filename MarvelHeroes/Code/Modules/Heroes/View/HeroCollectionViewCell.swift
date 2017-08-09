//
//  HeroCollectionViewCell.swift
//  MarvelHeroes
//
//  Created by José María Ila on 9/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

class HeroCollectionViewCell: UICollectionViewCell {
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = AppColors.grayDark.withAlphaComponent(0.7)
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initializeCell() {
        
        backgroundColor = AppColors.black
        
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(nameLabel)
        
        backgroundImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        backgroundImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        backgroundImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
}

extension HeroCollectionViewCell {
    
    override func prepareForReuse() {
        configure(viewModel: nil)
    }
}

extension HeroCollectionViewCell: CollectionableViewModelCellConfigurable {
    
    func configure(viewModel: HeroCellViewModel?) {
        nameLabel.text = viewModel?.name
        configureImage(fromUrlString: viewModel?.photo)
    }
    
    private func configureImage(fromUrlString urlString: String?) {
        if let urlString = urlString {
            backgroundImageView.setImage(fromUrlString: urlString)
        } else {
            backgroundImageView.image = nil
        }
    }
}
