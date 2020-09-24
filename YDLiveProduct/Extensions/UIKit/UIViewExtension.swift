//
//  YDUIViewExtension.swift
//  YDProduct
//
//  Created by Douglas Hennrich on 31/08/20.
//  Copyright © 2020 YourDev. All rights reserved.
//

import UIKit

extension UIView {
    
    func loadNib() -> UIView {
        let bundle = Bundle.init(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
}

// MARK: Layout
extension UIView {

    var safeTopAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.topAnchor
      }
      return self.topAnchor
    }

    var safeLeftAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.leftAnchor
      }
      return self.leftAnchor
    }

    var safeRightAnchor: NSLayoutXAxisAnchor {
      if #available(iOS 11.0, *){
        return self.safeAreaLayoutGuide.rightAnchor
      }
      return self.rightAnchor
    }

    var safeBottomAnchor: NSLayoutYAxisAnchor {
      if #available(iOS 11.0, *) {
        return self.safeAreaLayoutGuide.bottomAnchor
      }
      return self.bottomAnchor
    }
    
}

// MARK:
extension UIView {
    
    func setRoundCorners(for view: UIView, radius:CGFloat = 8) {
        view.layer.cornerRadius = radius
    }
    
    func setRoundCorners(for views: [UIView], radius: CGFloat = 8) {
        views.forEach { (view) in
            setRoundCorners(for: view, radius: radius)
        }
    }

    func setShadows(for view: UIView,
                    color: UIColor = UIColor.black.withAlphaComponent(0.08),
                    blur: Float = 20.0,
                    offset: CGSize = .zero, // CGSize(width: 1, height: 1),
                    spread: CGFloat = 1) {
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds,
                                             cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = color.cgColor
        view.layer.shadowOpacity = blur
        view.layer.shadowOffset = offset
        view.layer.shadowRadius = spread
    }

    func setShadows(for views: [UIView],
                    color: UIColor = UIColor.black.withAlphaComponent(0.08),
                    blur: Float = 0.8,
                    offset: CGSize = .zero, // CGSize(width: 1, height: 1),
                    spread: CGFloat = 5) {
        views.forEach { (view) in
            setShadows(for: view, color: color, blur: blur, offset: offset, spread: spread)
        }
    }
    
}
