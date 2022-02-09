//
//  NYTArticlesViewModel.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import Foundation

class HomeViewModel {
    var results: [Articles]?
    typealias CompletionHandler = (()->())?
    func getData(completionHandler: CompletionHandler) {
        APIHandler.shared.get(urlString: Constant.newsURL) { res in
            if let model = res?.results {
                self.results = model
                completionHandler?()
            }
        }
    }
    func getArticleCount() -> Int? {
        return results?.count
    }
    func getArticleTitle(index: Int) -> String? {
        return results?[index].title
    }
    func getArticleByline(index: Int) -> String? {
        return results?[index].byline
    }
    func getArticleDate(index: Int) -> String? {
        return results?[index].published_date
    }
    func getArticlePhoto(index: Int) -> String? {
        return results?[index].multimedia?[0].url
    }
    
}

//Lets get this bag boi

//Yeah boi i think i know wasssup now

//Hopefully I can conquer this

