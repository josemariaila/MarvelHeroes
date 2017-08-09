//
//  HeroesDataSource.swift
//  MarvelHeroes
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation

typealias SuccessCompletionBlock = (_ object: Superheroes) -> Void

protocol HeroesDataSourceInterface: DataSource {
    func getHeroes(success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock)
}

class HeroesDataSource {
    var url: String {
        return MarvelAPI.heroesList
    }
}

extension HeroesDataSource: HeroesDataSourceInterface {
    func getHeroes(success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock) {
        executeRequest(url: url, success: success, failure: failure)
    }
}
