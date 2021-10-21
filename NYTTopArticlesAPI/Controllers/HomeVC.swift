//
//  HomeVC.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import UIKit

class HomeVC: UIViewController, PassUrlData{
    let vm = HomeViewModel()
    let tblView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getTblData()
    }
    func getTblData(){
        vm.getData {
            DispatchQueue.main.async {
                self.tblView.vm = self.vm
                self.tblView.reloadData()
            }
        }
    }
    func setupUI() {
        tblView.delegate = self
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.backgroundColor = .systemGray
        view.addSubview(tblView)
        let viewDictionary = ["tblView": tblView]
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tblView]-0-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tblView]-0-|", options: [], metrics: nil, views: viewDictionary)
        view.addConstraints(hConstraints)
        view.addConstraints(vConstraints)
    }
    func passData(url: String) {
        let st = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "WebVC") as? WebVC
        if let vc = vc{
            vc.webURL = url
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

