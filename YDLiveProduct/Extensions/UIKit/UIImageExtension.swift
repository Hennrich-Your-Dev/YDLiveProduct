//
//  YDUIImage.swift
//  YDProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

extension UIImage {
    
    static let starIcon = UIImage(named: "starIcon",
                                  in: Bundle.init(for: YDLiveProductView.self),
                                  compatibleWith: nil)?
        .withRenderingMode(.alwaysTemplate)
    
}
