//
//  NYTTopArticlesAPITests.swift
//  NYTTopArticlesAPITests
//
//  Created by River Camacho on 10/15/21.
//

import XCTest
@testable import NYTTopArticlesAPI

class NYTTopArticlesAPITests: XCTestCase {
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    func testApi() {
        let expt = self.expectation(description: "Scaling")
        var res: [Articles]?
        APIHandler.shared.get(urlString: Constant.newsURL) { response in
                res = response?.results
                expt.fulfill()
            }
            waitForExpectations(timeout: 10) { error in
                XCTAssertGreaterThan(res?.count ?? 0, 0, "Must be greater than 0")
            }
        }
}
