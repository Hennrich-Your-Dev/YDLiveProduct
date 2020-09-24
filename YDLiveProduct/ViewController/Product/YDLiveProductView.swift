//
//  YDLiveProductView.swift
//  YDLiveProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit
import Cosmos

public class YDLiveProductView: UIView {

    // MARK: Properties
    var config: YDLiveProductConfigurationModel?
    public var callback: (() -> Void)?
    
    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var photoMaskView: UIView! {
        didSet {
            photoMaskView.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
            photoMaskView.layer.opacity = 0.1
        }
    }
    
    @IBOutlet weak var ratingView: CosmosView!
    
    @IBOutlet weak var addButton: UIButton! {
        didSet {
            addButton.layer.borderColor = UIColor.Product.red.cgColor
            addButton.layer.borderWidth = 1
            addButton.layer.cornerRadius = 4
        }
    }
    
    @IBOutlet weak var liveView: UIView! {
        didSet {
            liveView.layer.cornerRadius = liveView.frame.height / 2
        }
    }
    
    @IBOutlet weak var productEAN: UILabel!
    
    @IBOutlet weak var productName: UILabel!
    
    @IBOutlet weak var productPrice: UILabel!
    
    @IBOutlet weak var productPriceConditions: UILabel!
    
    // MARK: Life cycle
    @discardableResult
    public init(with config: YDLiveProductConfigurationModel,
                parent: UIView) {
        self.config = config
        let rect = CGRect(x: 0,
                          y: 0,
                          width: config.width,
                          height: config.height)
        super.init(frame: rect)
        commonInit()
        
        parent.addSubview(self)
        parent.bringSubviewToFront(self)
        applyProduct()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        addConstraintsToParent()
    }
    
    // MARK: Private actions
    private func commonInit() {
        backgroundColor = .clear
        contentView = loadNib()
        addSubview(contentView)
    }
    
    private func addConstraintsToParent() {
        guard let superview = superview,
            let config = config else {
            return
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        superview.addConstraints([
            self.widthAnchor.constraint(equalToConstant: config.width),
            self.heightAnchor.constraint(equalToConstant: config.height),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
    
    private func applyProduct() {
        guard let config = config else {
            return
        }
        
        let product = config.product
        
        setRoundCorners(for: contentView, radius: config.radius)
        contentView.layer.applySketchShadow(color: .black, alpha: 0.08, x: 0, y: 6, blur: 20, spread: -1)
        
        photoImageView.setImageFromUrl(product.images?.first?.medium)
        photoImageView.layer.cornerRadius = config.radius
        photoMaskView.layer.cornerRadius = config.radius
        
        if let ean = product.ean {
            productEAN.text = "código: \(ean)"
        } else {
            productEAN.isHidden = true
        }
        
        if let name = product.name {
            productName.text = name
        } else {
            productName.isHidden = true
        }
        
        if let price = product.getPrice() {
            productPrice.text = price
        } else {
            productPrice.isHidden = true
        }
        
        if let priceConditions = product.priceConditions {
            productPriceConditions.text = priceConditions
        } else {
            productPriceConditions.isHidden = true
        }
        
    }
    
    // MARK: IBActions
    @IBAction func addProduct(_ sender: UIButton) {
//        guard let product = config?.product else {
//            return
//        }
//        
//        const cartData = {
//          productId: productId,
//          sku: sku,
//          seller: sellerId,
//          skipServiceSelling: true,
//          openCartScreenAfterAdd: false,
//        }
//        IntegrationHelper.addProductToCart(cartData)
    }
    
    // MARK: Public actions
    public func config(with config: YDLiveProductConfigurationModel) {
        self.config = config
        applyProduct()
    }
    
}
