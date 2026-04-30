//
//  GenericTextField.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 30/04/2026.
//

import UIKit

class GenericTextField: UITextField {

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholdr: String, bgClr: UIColor, txtClr: UIColor, cornrRadius: CGFloat) {
        super.init(frame: .zero)
        placeholder = placeholdr
        backgroundColor = bgClr
        textColor = txtClr
        layer.cornerRadius = cornrRadius
        configureUI()
    }
    
    private func configureUI() {
        font = .systemFont(ofSize: 32, weight: .semibold)
        translatesAutoresizingMaskIntoConstraints = false
    }

}

#Preview {
    PayeeDetailViewController()
}
