//
//  MainRouter.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

typealias AcceptActionCompletion = (UIAlertAction) -> Void

protocol MainRouterInterface {
    func show(viewController: UIViewController, sender: Any?)
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?)
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?)
}

protocol RouterFactory {
    static func create(withMainRouter mainRouter: MainRouterInterface) -> UIViewController
}

class MainRouter {
    
    let window: UIWindow
    
    var rootViewController: UIViewController {
        
        guard let rootViewController = window.rootViewController else {
            fatalError("There is no rootViewController installed on the window")
        }
        
        return rootViewController
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func showRootViewController() {
        showListViewController()
    }
    
    func showListViewController() {
        let listViewController = HeroesRouter.create(withMainRouter: self)
        let rootViewController = UINavigationController(rootViewController: listViewController)
        window.rootViewController = rootViewController
    }
}

extension MainRouter: MainRouterInterface {
    
    func show(viewController: UIViewController, sender: Any?) {
        rootViewController.show(viewController, sender: sender)
    }
    
    func present(viewController: UIViewController, animated: Bool, completion:(() -> Void)?) {
        rootViewController.present(viewController, animated: animated, completion: completion)
    }
    
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?) {
        
        let alertController = UIAlertController(title: Strings.error.value,
                                                message: withMessage,
                                                preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: Strings.accept.value,
                                         style: .default,
                                         handler: completion)
        
        alertController.addAction(acceptAction)
        present(viewController: alertController, animated: true, completion: nil)
    }
}
