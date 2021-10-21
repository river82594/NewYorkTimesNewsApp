//
//  HomeTVC.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/15/21.
//

import UIKit
import SDWebImage
class HomeTVC: UITableViewCell {
    var titleLbl = UILabel()
    var bylineLbl = UILabel()
    var publishedDataLbl = UILabel()
    var cellImage = UIImageView()
    var date = Date()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    //------------Programmating Autolayout using VFL to set the label------------------------//
    func setupUI() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        titleLbl.numberOfLines = 0
        bylineLbl.translatesAutoresizingMaskIntoConstraints = false
        bylineLbl.numberOfLines = 0
        publishedDataLbl.translatesAutoresizingMaskIntoConstraints = false
        publishedDataLbl.numberOfLines = 0
        cellImage.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellImage)
        addSubview(titleLbl)
        addSubview(bylineLbl)
        addSubview(publishedDataLbl)
        let viewDictionary = ["titleLbl": titleLbl, "bylineLbl": bylineLbl, "publishedDataLbl": publishedDataLbl, "cellImage": cellImage]
        let hConstraints4 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[cellImage(350)]-0-|", options: [], metrics: nil, views: viewDictionary)
        let hConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[titleLbl]-20-|", options: [], metrics: nil, views: viewDictionary)
        let hConstraints2 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[bylineLbl]-20-|", options: [], metrics: nil, views: viewDictionary)
        let hConstraints3 = NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[publishedDataLbl]-20-|", options: [], metrics: nil, views: viewDictionary)
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[cellImage(220)]-5-[titleLbl]-5-[bylineLbl]-5-[publishedDataLbl]-20-|", options: [], metrics: nil, views: viewDictionary)
        addConstraints(hConstraints)
        addConstraints(hConstraints2)
        addConstraints(hConstraints3)
        addConstraints(hConstraints4)
        addConstraints(vConstraints)
    }
    //-------------Method that is used to assign the labels text to the-------------------//
    //-------------text that will be passed from the tableview cellforRowAt---------------//
    func setData(title: String, byline: String, published: String, url: String) {
        titleLbl.text = title
        bylineLbl.text = byline
        publishedDataLbl.dateFormat(date: published)
        cellImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage())
    }
}
