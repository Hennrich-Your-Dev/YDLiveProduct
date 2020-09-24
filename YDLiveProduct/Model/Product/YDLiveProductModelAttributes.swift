//
//  YDLiveProductAttributes.swift
//  ObjB2WBarcodeScanner
//
//  Created by Douglas Hennrich on 13/08/20.
//  Copyright © 2020 Objective Solutions. All rights reserved.
//

import Foundation

public struct YDLiveProductModelAttributesContainer: Codable {
    
    let properties: [YDLiveProductModelAttributes]?
    let title: String?
    
}

public struct YDLiveProductModelAttributes: Codable {
    
    let name: String
    let value: String
    
}
