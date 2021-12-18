//
//  ExtensionManager.swift
//  Typicode
//
//  Created by Reynaldo Cristinus Hutahaean on 17/12/21.
//

import Foundation
import UIKit

class ExtensionManager {
    
}

extension UIView {
    
    func roundedCorner(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
    }
    
    func dropShadow(opacity: Float = 0.05, height: CGFloat = 4) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: height)
        self.layer.shadowRadius = 4
        
        self.layer.rasterizationScale = UIScreen.main.scale
        self.layer.shouldRasterize = true
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func addBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    func setButton(width: CGFloat, color: CGColor, cornerRadius: CGFloat, backgroundColor: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
        self.layer.cornerRadius = cornerRadius
        self.layer.backgroundColor = backgroundColor
    }
}

extension UIButton{

    func setImageTintColor(_ color: UIColor) {
        let tintedImage = self.imageView?.image?.withRenderingMode(.alwaysTemplate)
        self.setImage(tintedImage, for: .normal)
        self.tintColor = color
    }

}
