//
//  NYTTopArticlesAPITests.swift
//  NYTTopArticlesAPITests
//
//  Created by River Camacho on 10/15/21.
//

import XCTest
@testable import NYTTopArticlesAPI

class NYTTopArticlesAPITests: XCTestCase {
    var vm: HomeViewModel?
    override func setUpWithError() throws {
        vm = HomeViewModel()
    }

    override func tearDownWithError() throws {
        vm = nil
    }
    
    func testApi() {
        //Given these conditions
        let expt = self.expectation(description: "Scaling")
        var res: [Articles]?
        
        //When these actions are perfromed
        APIHandler.shared.get(urlString: Constant.newsURL) { response in
                res = response?.results
                expt.fulfill()
            }
        
        //Then this is expected outcome
            waitForExpectations(timeout: 10) { error in
                XCTAssertGreaterThan(res?.count ?? 0, 0, "Must be greater than 0")
            }
        }
    func testGetArticleCount() {
        //Given these conditons
        vm?.results = [Articles(title: "hello", byline: "world", published_date: "today", url: "isnotmy", multimedia: [Media]())]
        //When these actions are performed

        //Then this is expected outcome
        XCTAssertEqual(vm?.getArticleCount(), 1)
    }
    func testGetArticleTitle() {
        //Given these conditions
        vm?.results = [Articles(title: "hello", byline: "world", published_date: "today", url: "isnotmy", multimedia: [Media]())]
        //When thes actions are performed

        //Then this is expected outcome
        XCTAssertEqual(vm?.getArticleTitle(index: 0), "hello")
}
    func testGetArticleByline() {
        //Given these conditions
        vm?.results = [Articles(title: "hello", byline: "world", published_date: "today", url: "isnotmy", multimedia: [Media]())]
        //When thes actions are performed

        //Then this is expected outcome
        XCTAssertEqual(vm?.getArticleByline(index: 0), "world")
    }
    func testGetArticleDate() {
        //Given these conditions
        vm?.results = [Articles(title: "hello", byline: "world", published_date: "today", url: "isnotmy", multimedia: [Media]())]
        //When thes actions are performed

        //Then this is expected outcome
        XCTAssertEqual(vm?.getArticleDate(index: 0), "today")
    }
    func testGetArticlePhoto() {
        //Given these conditions
        let objMedia: Media = Media(url: "media")
        vm?.results = [Articles(title: "hello", byline: "world", published_date: "today", url: "isnotmy", multimedia: [objMedia])]
        XCTAssertEqual(vm?.getArticlePhoto(index: 0), "media")
        vm?.results = [Articles(title: nil, byline: nil, published_date: nil, url: nil, multimedia: nil)]
        XCTAssertEqual(vm?.getArticlePhoto(index: 0), nil)
    }
    func testGetArticleNil() {
        XCTAssertEqual(vm?.getArticleCount(), nil)
        XCTAssertEqual(vm?.getArticleTitle(index: 0), nil)
        XCTAssertEqual(vm?.getArticleByline(index: 0), nil)
        XCTAssertEqual(vm?.getArticleDate(index: 0), nil)
        XCTAssertEqual(vm?.getArticlePhoto(index: 0), nil)
    }
}
