//
//  PaymentsItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class PaymentsItemCell: UICollectionViewCell {
    
    private let itemImage = GenericImage(imageName: UIImage(systemName: "phone")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)

    private let itemLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .medium), color: .gray, mytext: "Afef", myNumberOfLines: 0, clickable: false, txtAlignment: .center)
    
    static let identifier = "cellIdentifier"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        contentView.addSubview(itemImage)
        contentView.addSubview(itemLbl)
        
        contentView.backgroundColor = .gray.withAlphaComponent(0.1)
        
        contentView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            
            itemImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            itemImage.heightAnchor.constraint(equalToConstant: 40),
            itemImage.widthAnchor.constraint(equalToConstant: 36),

            itemLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            itemLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            itemLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
            itemLbl.heightAnchor.constraint(equalToConstant: 36),
            
        ])
    }
        
    func itemCell(image: UIImage, title: String) {
        self.itemImage.image = image
        self.itemLbl.text = title
        self.setupUI()
    }
    
}

#Preview {
    PaymentsItemCell()
}
