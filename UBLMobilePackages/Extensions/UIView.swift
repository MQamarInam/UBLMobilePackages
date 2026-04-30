//
//  UIView.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 29/04/2026.
//

import Foundation
import UIKit

extension UIView {
    
    func addGradient(colors: [UIColor], startFrom: CGPoint, endTo: CGPoint, cornerRadius: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.name = "myGradient"
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startFrom
        gradientLayer.endPoint = endTo
        gradientLayer.cornerRadius = cornerRadius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
