//
//  PayeesItemCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class PayeesItemCell: UITableViewCell {
    
    private var payeeInitials: GenericLabel = {
        let payeeInitials = GenericLabel(myfont: .systemFont(ofSize: 35, weight: .medium), color: .black, backgroundClr: .clear, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 0)
        payeeInitials.backgroundColor = .gray.withAlphaComponent(0.3)
        payeeInitials.layer.cornerRadius = 30
        payeeInitials.clipsToBounds = true
        return payeeInitials
    }()
    private let navigationIcon = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeNumber = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, backgroundClr: .clear, mytext: "03080044493", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeNetworkType = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeContentView: UIView = {
        let payeeContentView = UIView()
        payeeContentView.backgroundColor = .gray.withAlphaComponent(0.1)
        payeeContentView.translatesAutoresizingMaskIntoConstraints = false
        payeeContentView.layer.cornerRadius = 20
        return payeeContentView
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
        
        contentView.addSubview(payeeContentView)
        payeeContentView.addSubview(navigationIcon)
        payeeContentView.addSubview(payeeInitials)
        payeeContentView.addSubview(payeeName)
        payeeContentView.addSubview(payeeNumber)
        payeeContentView.addSubview(payeeNetworkType)
        
        NSLayoutConstraint.activate([
            
            payeeContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            payeeContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            payeeContentView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            payeeContentView.heightAnchor.constraint(equalToConstant: 100),
            
            payeeInitials.centerYAnchor.constraint(equalTo: payeeContentView.centerYAnchor),
            payeeInitials.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 20),
            payeeInitials.widthAnchor.constraint(equalToConstant: 60),
            payeeInitials.heightAnchor.constraint(equalToConstant: 60),
            
            payeeName.bottomAnchor.constraint(equalTo: payeeNumber.topAnchor, constant: -2),
            payeeName.leadingAnchor.constraint(equalTo: payeeInitials.trailingAnchor, constant: 20),
            
            payeeNumber.centerYAnchor.constraint(equalTo: payeeContentView.centerYAnchor),
            payeeNumber.leadingAnchor.constraint(equalTo: payeeInitials.trailingAnchor, constant: 20),
            
            payeeNetworkType.topAnchor.constraint(equalTo: payeeNumber.bottomAnchor, constant: 2),
            payeeNetworkType.leadingAnchor.constraint(equalTo: payeeInitials.trailingAnchor, constant: 20),
            
            navigationIcon.centerYAnchor.constraint(equalTo: payeeContentView.centerYAnchor),
            navigationIcon.trailingAnchor.constraint(equalTo: payeeContentView.trailingAnchor, constant: -15),
            navigationIcon.widthAnchor.constraint(equalToConstant: 18),
            navigationIcon.heightAnchor.constraint(equalToConstant: 18),
            
        ])
    }
    
    func setupPayeeCell(title: String, number: String, networkType: String) {
        self.payeeInitials.text = title.getInitials()
        payeeName.text = title
        payeeNumber.text = number
        payeeNetworkType.text = networkType
    }

}

#Preview {
    PayeesItemCell()
}
