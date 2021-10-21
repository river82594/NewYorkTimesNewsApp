//
//  HomeView.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import UIKit

class HomeView: UIView, UITableViewDelegate, UITableViewDataSource {
    let tblview =  UITableView()
    var vm = HomeViewModel()
    var delegate: PassUrlData?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    func reloadData() {
        tblview.backgroundColor = .white
        tblview.reloadData()
    }
    //----- Programmatic Autolayout for Tableview. Datasource and Delegate will also be set here -------------------//
    func setupUI() {
        addSubview(tblview)
        tblview.delegate = self
        tblview.dataSource = self
        tblview.translatesAutoresizingMaskIntoConstraints = false
        tblview.register(HomeTVC.self, forCellReuseIdentifier: "cell")
        let viewDictionary = ["tblview": tblview]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tblview]-0-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tblview]-0-|", options: [], metrics: nil, views: viewDictionary)
        addConstraints(hConstraints)
        addConstraints(vConstraints)
    }
    //------- Tableview Delegate Methods ------------------//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getArticleCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? HomeTVC
        let title = vm.getArticleTitle(index: indexPath.row) ?? ""
        let byline = vm.getArticleByline(index: indexPath.row) ?? ""
        let date = vm.getArticleDate(index: indexPath.row) ?? ""
        let photo = vm.getArticlePhoto(index: indexPath.row) ?? ""
        cell?.setData(title: title, byline: byline, published: date, url: photo)
        return cell ?? HomeTVC()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.passData(url: vm.results?[indexPath.row].url ?? "")
    }
}
protocol PassUrlData {
    func passData(url: String)
}
