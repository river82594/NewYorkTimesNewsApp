//
//  WebVC.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import UIKit
import WebKit
class WebVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var webURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: webURL ?? ""){
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
}
