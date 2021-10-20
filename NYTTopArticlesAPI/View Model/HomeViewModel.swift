//
//  NYTArticlesViewModel.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import Foundation

class HomeViewModel {
    var results: [Articles] = []
    typealias CompletionHandler = (()->())?
    func getData(completionHandler: CompletionHandler) {
        APIHandler.shared.get(urlString: Constant.newsURL) { res in
            if let model = res?.results {
                self.results = model
                completionHandler?()
            }
        }
    }
}
