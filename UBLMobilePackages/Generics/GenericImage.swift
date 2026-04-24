//
//  GenericImage.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class GenericImage: UIImageView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(imageName: UIImage, contntMode: UIView.ContentMode, tintClr: UIColor, bgColor: UIColor, cornrRadius: CGFloat) {
        super.init(frame: .zero)
        contentMode = contntMode
        tintColor = tintClr
        backgroundColor = bgColor
        layer.cornerRadius = cornrRadius
        image = imageName
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
