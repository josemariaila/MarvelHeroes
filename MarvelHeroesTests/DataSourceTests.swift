//
//  DataSourceTests.swift
//  MarvelHeroesTests
//
//  Created by José María Ila on 8/8/17.
//  Copyright © 2017 José María Ila. All rights reserved.
//

import XCTest
@testable import MarvelHeroes

class DataSourceTests: XCTestCase {
    let fooDataSource = FooDataSource()

    override func tearDown() {
        fooDataSource.downloadOnError = false
        super.tearDown()
    }

    func testOnParsingSuccess() {

        fooDataSource.downloadFooJSON(success: { foo in
            XCTAssertEqual(foo.name!, "Jose")
            XCTAssertEqual(foo.lastName!, "Ila")
            XCTAssertEqual(foo.email!, "joseila85@gmail.com")

        }, failure: { _ in

        })
    }

    func testOnParsingError() {

        fooDataSource.downloadOnError = true
        fooDataSource.downloadFooJSON(success: { _ in

        }, failure: { error in
            XCTAssertNotNil(error)
        })
    }
}
