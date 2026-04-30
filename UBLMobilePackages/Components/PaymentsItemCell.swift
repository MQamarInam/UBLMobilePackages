//
//  PaymentsItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class PaymentsItemCell: UICollectionViewCell {
    
    private let paymentItemImage = GenericImage(imageName: UIImage(systemName: "phone")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)

    private let paymentItemLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Afef", myNumberOfLines: 0, clickable: false, txtAlignment: .center, cornerRadius: 0)
    
    static let identifier = "cellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(paymentItemImage)
        contentView.addSubview(paymentItemLbl)
        contentView.backgroundColor = .gray.withAlphaComponent(0.1)
        contentView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            
            paymentItemImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paymentItemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            paymentItemImage.heightAnchor.constraint(equalToConstant: 40),
            paymentItemImage.widthAnchor.constraint(equalToConstant: 36),

            paymentItemLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            paymentItemLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            paymentItemLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            paymentItemLbl.heightAnchor.constraint(equalToConstant: 36),
            
        ])
    }
        
    func setupPaymentCell(image: UIImage, title: String) {
        self.paymentItemImage.image = image
        self.paymentItemLbl.text = title
    }
    
}

#Preview {
    PaymentsItemCell()
}
