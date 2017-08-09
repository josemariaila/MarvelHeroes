//
//  UIViewController+UIAlertController.swift
//  MarvelHeroes
//
//  Created by José María Ila on 9/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import UIKit

typealias AcceptActionCompletion = (UIAlertAction) -> Void

extension UIViewController {
    
    func presentAlertController(withMessage: String, completion: AcceptActionCompletion?) {
        
        let alertController = UIAlertController(title: Strings.error.value,
                                                message: withMessage,
                                                preferredStyle: .alert)
        
        let acceptAction = UIAlertAction(title: Strings.accept.value,
                                         style: .default,
                                         handler: completion)
        
        alertController.addAction(acceptAction)
        present(alertController, animated: true, completion: nil)
    }
}
