//
//  HeroCellViewModel.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

struct HeroCellViewModel {
    let name: String
    let photo: String
    let selectionBlock: () -> Void
}

extension HeroCellViewModel: CollectionableViewModel {
    func onRowSelected() {
        selectionBlock()
    }
}
