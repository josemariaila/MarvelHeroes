//
//  DetailViewController.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let presenter: HeroesPresenterInterface

    lazy var scrollView: UIScrollView = { [unowned self] in
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = AppColors.clear
        self.view.addSubview(scrollView)

        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        return scrollView
    }()

    lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = Sizes.spacing10
        self.scrollView.addSubview(stackView)

        stackView.layoutMargins = UIEdgeInsets(top: Sizes.spacing30, left: Sizes.spacing20, bottom: Sizes.spacing30, right: Sizes.spacing20)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.topAnchor.constraint(equalTo: self.photoImageView.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.scrollView.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.scrollView.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true

        return stackView
    }()

    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var realNameHeightLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = AppColors.clear
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    lazy var powerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = AppColors.clear
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    lazy var abilitiesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = AppColors.clear
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    lazy var groupsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = AppColors.clear
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()

    init(presenter: HeroesPresenterInterface) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeView()
        configure()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter.detailDidDisappear()
    }

    func initializeView() {

        view.backgroundColor = AppColors.black

        scrollView.addSubview(photoImageView)
        stackView.addArrangedSubview(realNameHeightLabel)
        stackView.addArrangedSubview(powerLabel)
        stackView.addArrangedSubview(abilitiesLabel)
        stackView.addArrangedSubview(groupsLabel)

        photoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: Sizes.size250).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    }

    func configure() {

        guard let heroDetailViewModel = presenter.heroDetail else {
            return
        }

        title = heroDetailViewModel.name
        photoImageView.setImage(fromUrlString: heroDetailViewModel.photo)
        realNameHeightLabel.text = heroDetailViewModel.realNameHeight
        powerLabel.text = heroDetailViewModel.power
        abilitiesLabel.text = heroDetailViewModel.abilities
        groupsLabel.text = heroDetailViewModel.groups
    }
}
