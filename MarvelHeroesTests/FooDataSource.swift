//
//  FooDataSource.swift
//  MarvelHeroes
//
//  Created by José María Ila on 9/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import Foundation
import ObjectMapper

typealias SuccessCompletionBlock = (_ object: Foo) -> Void

class FooDataSource: DataSource {
    
    var downloadOnError = false
    
    func downloadFooJSON(success: @escaping SuccessCompletionBlock, failure: @escaping FailureCompletionBlock) {
        
        var path: String = ""
        let bundle = Bundle(for: FooDataSource.self)
        
        if downloadOnError {
            path = bundle.path(forResource: "FooJSON", ofType: "json")!
        } else {
            path = bundle.path(forResource: "EmptyJSON", ofType: "json")!
        }
        executeRequest(url: path, success: success, failure: failure)
    }
}

class Foo: NSObject, Mappable {
    
    var name: String?
    var lastName: String?
    var email: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        lastName <- map["lastName"]
        email <- map["email"]
    }
}
