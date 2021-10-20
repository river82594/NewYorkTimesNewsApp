//
//  APIHandler.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    
    typealias CompletionHandler = ((NYTimesModel?) -> ())?
    
    func get(urlString:String, completionHandler:CompletionHandler){
        if let url = URL(string: urlString){
            URLSession.shared.dataTask(with: url) { Data, Response, Error in
                if let data = Data{
                    let model = try? JSONDecoder.init().decode(NYTimesModel.self, from: data)
                    completionHandler?(model)
                }
            }.resume()
        }
    }
}
