//
//  YDUIImageView.swift
//  YDProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    
    public func setImageFromUrl(_ urlString: String?) {
        let placeHolder = UIImage(named: "ImagePlaceholder",
                                  in: Bundle(for: YDLiveProductView.self),
                                  compatibleWith: nil)
        
        guard let urlString = urlString,
            let url = URL(string: urlString)
            else {
                self.image = placeHolder
                return
        }
        
        Alamofire.request(url).responseData { [weak self] response in
            if let data = response.data,
                let image = UIImage(data: data) {
                self?.image = image
            } else {
                self?.image = placeHolder
            }
        }
    }
    
}
