//
//  Extensions.swift
//  NYTTopArticlesAPI
//
//  Created by River Camacho on 10/21/21.
//

import UIKit

extension UILabel{
    func dateFormat(date:String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        let dateTranslate = DateFormatter()
        dateTranslate.dateFormat = "MMM dd,yyyy"
        if let Date = dateFormatter.date(from: date) {
            self.text = dateTranslate.string(from: Date)
        }
    }
}
/*
 Wednesday, Sep 12, 2019   --> EEEE, MMM d, yyyy
 09/12/2018                --> MM/dd/yyyy
 09-12-2018 14:11          --> MM-dd-yyy HH:mm
 Sep 12, 2:11 PM           --> MMM d, h:mm a
 September 2018            --> MMMM, yyyy
 Sep 12, 2018              --> E, d MMM yyyy HH:mm:ss Z
 */
