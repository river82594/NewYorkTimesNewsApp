//
//  NYTimes.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import Foundation

struct NYTimesModel: Codable {
    var results: [Articles]?
}
struct Articles: Codable {
    var title: String?
    var byline: String?
    var published_date: String?
    var url: String?
    let multimedia:[Media]?
}
struct Media: Codable {
    let url: String?
}
