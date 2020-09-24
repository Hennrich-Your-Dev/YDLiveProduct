//
//  YDLiveProductImage.swift
//  ObjB2WBarcodeScanner
//
//  Created by Douglas Hennrich on 13/08/20.
//  Copyright © 2020 Objective Solutions. All rights reserved.
//

import Foundation

public struct YDLiveProductModelImage: Codable {
    let big: String?
    let extraLarge: String?
    let large: String?
    let medium: String?
    let small: String?
    
    public init(extraLarge: String? = nil,
                big: String? = nil,
                large: String? = nil,
                medium: String? = nil,
                small: String? = nil) {
        self.extraLarge = extraLarge
        self.big = big
        self.large = large
        self.medium = medium
        self.small = small
    }
}
