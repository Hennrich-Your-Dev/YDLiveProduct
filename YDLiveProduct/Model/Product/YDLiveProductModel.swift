//
//  YDLiveProduct.swift
//  ObjB2WBarcodeScanner
//
//  Created by Douglas Hennrich on 13/08/20.
//  Copyright © 2020 Objective Solutions. All rights reserved.
//

import UIKit

public class YDLiveProductModel: Codable {
    public var attributes: [YDLiveProductModelAttributesContainer]?
    public var description: String?
    public var id: String?
    public var images: [YDLiveProductModelImage]?
    public var name: String?
    public var price: Double?
    public var priceConditions: String?
    public var ean: String?
    public var rating: YDLiveProductModelRating?
    public var isAvailable: Bool = true
    
    public init(attributes: [YDLiveProductModelAttributesContainer]?,
                description: String?,
                id: String?,
                images: [YDLiveProductModelImage]?,
                name: String?,
                price: Double?,
                priceConditions: String?,
                ean: String?,
                rating: YDLiveProductModelRating?,
                isAvailable: Bool = true) {
        
        self.attributes = attributes
        self.description = description
        self.id = id
        self.images = images
        self.name = name
        self.price = price
        self.priceConditions = priceConditions
        self.ean = ean
        self.rating = rating
        self.isAvailable = isAvailable
        
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        attributes = try? container.decode([YDLiveProductModelAttributesContainer].self,
                                           forKey: .attributes)
        
        description = try? container.decode(String.self,
                                            forKey: .description)
        
        id = try? container.decode(String.self,
                                   forKey: .id)
        
        images = try? container.decode([YDLiveProductModelImage].self,
                                       forKey: .images)
        
        name = try? container.decode(String.self,
                                     forKey: .name)
        
        price = try? container.decode(Double.self,
                                      forKey: .price)
        
        priceConditions = try? container.decode(String.self,
                                                forKey: .priceConditions)
        
        ean = try? container.decode(String.self,
                                    forKey: .ean)
        
        rating = try? container.decode(YDLiveProductModelRating.self,
                                       forKey: .rating)
        
        isAvailable = true
    }
    
}

extension YDLiveProductModel {
    
    public func getPrice() -> String? {
        guard let price = price else { return nil }
        let formatter = NumberFormatter()
        formatter.alwaysShowsDecimalSeparator = true
        formatter.locale = Locale(identifier: "pt_br")
        formatter.numberStyle = .currency
        
        return formatter.string(for: price)
    }

    public func getHtmlDescription() -> NSMutableAttributedString? {
        guard let description = description?.data(using: .utf8) else { return nil }

        do {
            let attributedString = try NSMutableAttributedString(data: description,
                                             options: [
                                                .documentType: NSAttributedString.DocumentType.html,
                                                .characterEncoding: String.Encoding.utf8.rawValue
            ],
                                             documentAttributes: nil)
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 3
            
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
            
            return attributedString
        } catch {
            return NSMutableAttributedString()
        }
    }
    
    public func getTechnicalInformation() -> [YDLiveProductModelAttributes] {
        return attributes?.first?.properties ?? []
    }
    
}
