//
//  PayeesItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class PayeesItemCell: UITableViewCell {

    private let myImage = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private var initials = GenericLabel(myfont: .systemFont(ofSize: 35, weight: .medium), color: .black, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let myTitle = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNumber = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, mytext: "03080044493", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNetworkType = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
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
        myView.addSubview(initials)
        myView.addSubview(myTitle)
        myView.addSubview(myNumber)
        myView.addSubview(myNetworkType)
        
        initials.backgroundColor = .gray.withAlphaComponent(0.3)
        initials.layer.cornerRadius = 30
        initials.clipsToBounds = true
        
        myView.backgroundColor = .gray.withAlphaComponent(0.1)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.cornerRadius = 20
        
        contentView.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            
            myView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myView.heightAnchor.constraint(equalToConstant: 100),
            
            initials.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            initials.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 20),
            initials.widthAnchor.constraint(equalToConstant: 60),
            initials.heightAnchor.constraint(equalToConstant: 60),
            
            myTitle.bottomAnchor.constraint(equalTo: myNumber.topAnchor, constant: -2),
            myTitle.leadingAnchor.constraint(equalTo: initials.trailingAnchor, constant: 20),
            
            myNumber.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            myNumber.leadingAnchor.constraint(equalTo: initials.trailingAnchor, constant: 20),
            
            myNetworkType.topAnchor.constraint(equalTo: myNumber.bottomAnchor, constant: 2),
            myNetworkType.leadingAnchor.constraint(equalTo: initials.trailingAnchor, constant: 20),
            
            myImage.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            myImage.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -15),
            myImage.widthAnchor.constraint(equalToConstant: 18),
            myImage.heightAnchor.constraint(equalToConstant: 18),
            
        ])
    }
    
    func setupCell(initials: String, title: String, number: String, networkType: String) {
        self.initials.text = initials
        myTitle.text = title
        myNumber.text = number
        myNetworkType.text = networkType
    }

}

#Preview {
    PayeesItemCell()
}
