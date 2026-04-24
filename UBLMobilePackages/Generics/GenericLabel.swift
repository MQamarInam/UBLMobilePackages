//
//  GenericLabel.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class GenericLabel: UILabel {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(myfont: UIFont, color: UIColor, mytext: String, myNumberOfLines: Int, clickable: Bool, txtAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        font = myfont
        textColor = color
        text = mytext
        textAlignment = txtAlignment
        lineBreakMode = .byWordWrapping
        numberOfLines = myNumberOfLines
        isUserInteractionEnabled = clickable
        translatesAutoresizingMaskIntoConstraints = false
    }

}
