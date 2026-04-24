//
//  PackagesItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class NetworkItemCell: UITableViewCell {
            
    private let myImage = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private let myTitle = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .semibold), color: .black, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myView = UIView()
    
    static let identifier = "myIdentifier"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        contentView.addSubview(myView)
        
        myView.addSubview(myImage)
        myView.addSubview(myTitle)
        
        myView.backgroundColor = .gray.withAlphaComponent(0.1)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.cornerRadius = 20
        
        contentView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            myView.heightAnchor.constraint(equalToConstant: 90),
            myTitle.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            myTitle.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 25),
            
            myImage.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            myImage.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -15),
            myImage.widthAnchor.constraint(equalToConstant: 18),
            myImage.heightAnchor.constraint(equalToConstant: 18),
            
        ])
    }
    
    func setupCell(title: String) {
        myTitle.text = title
    }
    
}

#Preview {
    NetworksListVC()
}
