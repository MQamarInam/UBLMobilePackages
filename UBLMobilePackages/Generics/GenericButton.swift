//
//  GenericButton.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class GenericButton: UIButton {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(bgColor: UIColor, tintClr: UIColor, title: String, titleImg: UIImage, imageSize: CGFloat, labelFont: UIFont, cornrRadius: CGFloat) {
        super.init(frame: .zero)
        backgroundColor = bgColor
        titleLabel?.font = labelFont
        layer.cornerRadius = cornrRadius
        setTitle(title, for: .normal)
        tintColor = tintClr
        let config = UIImage.SymbolConfiguration(pointSize: imageSize, weight: .regular)
        setImage(titleImg.withConfiguration(config), for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
