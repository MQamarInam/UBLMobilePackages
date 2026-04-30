//
//  PackagesItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class NetworkItemCell: UITableViewCell {
            
    private let companyItemImage = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private let companyItemTitle = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let companyItemBackgroundView: UIView = {
        let companyItemBackgroundView = UIView()
        companyItemBackgroundView.backgroundColor = .gray.withAlphaComponent(0.1)
        companyItemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        companyItemBackgroundView.layer.cornerRadius = 20
        return companyItemBackgroundView
    }()
    
    static let identifier = "myIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        contentView.addSubview(companyItemBackgroundView)
        companyItemBackgroundView.addSubview(companyItemImage)
        companyItemBackgroundView.addSubview(companyItemTitle)
        
        NSLayoutConstraint.activate([
            
            companyItemBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            companyItemBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            companyItemBackgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            companyItemBackgroundView.heightAnchor.constraint(equalToConstant: 90),
            companyItemTitle.centerYAnchor.constraint(equalTo: companyItemBackgroundView.centerYAnchor),
            companyItemTitle.leadingAnchor.constraint(equalTo: companyItemBackgroundView.leadingAnchor, constant: 25),
            
            companyItemImage.centerYAnchor.constraint(equalTo: companyItemBackgroundView.centerYAnchor),
            companyItemImage.trailingAnchor.constraint(equalTo: companyItemBackgroundView.trailingAnchor, constant: -15),
            companyItemImage.widthAnchor.constraint(equalToConstant: 18),
            companyItemImage.heightAnchor.constraint(equalToConstant: 18),
            
        ])
    }
    
    func setupCompanyCell(title: String) {
        companyItemTitle.text = title
    }
    
}

#Preview {
    NetworksListViewController()
}
