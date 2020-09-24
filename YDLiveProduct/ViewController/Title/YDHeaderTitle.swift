//
//  YDHeaderTitle.swift
//  YDLiveProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

public class YDHeaderTitle: UIView {
    
    // MARK: IBInspectable
    @IBInspectable var headerTitle: String? {
        didSet {
            titleLabel.text = headerTitle
        }
    }
    
    // MARK: Properties

    // MARK: IBOutlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Life cycle
    @discardableResult
    public init(with config: YDHeaderConfigurationModel,
                parent: UIView) {
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: config.width ??
                            UIApplication.shared.windows.first?.bounds.width ?? 320,
                          height: config.height)
        
        super.init(frame: rect)
        
        parent.frame = rect
        parent.addSubview(self)
        commonInit()
        
        assignParentConstraints(with: config, parent: parent)
        
        titleLabel.text = config.title
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        contentView = loadNib()
        addSubview(contentView)
    }
    
    // MARK: Private actions
    private func assignParentConstraints(with config: YDHeaderConfigurationModel,
                                         parent: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 30),
            contentView.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 3)
        ])
        
        parent.addConstraints(constraints)
    }
    
}
