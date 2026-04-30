//
//  EachNetworkPackageCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class AllNetworkPackageCell: UITableViewCell {
    
//    MARK: UISection
    private var mobilePackageTitle = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .bold), color: .white, backgroundClr: .clear, mytext: "Super Ganta", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageValidityLbl: GenericLabel = {
        let packageValidityLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .semibold), color: .white, backgroundClr: .clear, mytext: "5 Days", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 20)
        packageValidityLbl.backgroundColor = .red
        return packageValidityLbl
    }()
    private var packageSubscribeBtn: GenericButton = {
        let packageSubscribeBtn = GenericButton(bgColor: .black, tintClr: .white,title: "Subscribe", imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 18)
        packageSubscribeBtn.setImage(UIImage(named: "person"), for: .normal)
        return packageSubscribeBtn
    }()
    var dataSection: UIView = {
        let dataSection = UIView()
        return dataSection
    }()
    var onNetMinSection: UIView = {
        let dataSection = UIView()
        return dataSection
    }()
    var otherMinSection: UIView = {
        let dataSection = UIView()
        return dataSection
    }()
    var smsSection: UIView = {
        let dataSection = UIView()
        return dataSection
    }()
    private let packageDataLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Data", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageDataValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "1 GB", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 0)
    private let packageOnNetMinLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "On Net Min", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageOnNetMinValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "5000", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 0)
    private let packageOtherMinLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Other Min", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageOtherMinValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "500", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 0)
    private let packageSmsLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "SMS", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageSmsValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "1000", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 0)
    private let packageIncludesLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Package Includes", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packageIncludesValue = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "1 GB, 500 SMS", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let packagePriceLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .medium), color: .gray, backgroundClr: .clear, mytext: "Amount", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private var packagePriceValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Rs 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    let packageItemHeaderView: UIView = {
        let headerView = UIView()
        headerView.layer.cornerRadius = 20
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    private let packageItemContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private let amountSection: UIView = {
        let amountSection = UIView()
        amountSection.backgroundColor = .gray.withAlphaComponent(0.1)
        amountSection.layer.cornerRadius = 12
        amountSection.translatesAutoresizingMaskIntoConstraints = false
        return amountSection
    }()
    private let packageItemStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 1
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

//    MARK: Variables
    static let identifier = "myIdentifier"
    
//    MARK: Ovveridens
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if packageItemHeaderView.layer.sublayers == nil && packageItemHeaderView.bounds != .zero {
            packageItemHeaderView.addGradient(
                colors: [UIColor.orange.withAlphaComponent(0.7), UIColor.systemPink.withAlphaComponent(0.7), UIColor.systemPink.withAlphaComponent(0.7)],
                startFrom: .init(x: 0, y: 0),
                endTo: .init(x: 1, y: 1),
                cornerRadius: 20)
        }
    }
    
//    MARK: Functions
    private func configureUI() {
        
        contentView.addSubview(packageItemHeaderView)
        contentView.addSubview(packageItemContentView)
        contentView.addSubview(mobilePackageTitle)
        contentView.addSubview(packageValidityLbl)
        packageItemContentView.addSubview(amountSection)
        packageItemContentView.addSubview(packageIncludesLbl)
        packageItemContentView.addSubview(packageIncludesValue)
        packageItemContentView.addSubview(packageItemStackView)
        packageItemContentView.addSubview(dataSection)
        packageItemContentView.addSubview(onNetMinSection)
        packageItemContentView.addSubview(otherMinSection)
        amountSection.addSubview(packagePriceLbl)
        amountSection.addSubview(packagePriceValue)
        amountSection.addSubview(packageSubscribeBtn)
        
        dataSection.addSubview(packageDataLbl)
        dataSection.addSubview(packageDataValue)
        onNetMinSection.addSubview(packageOnNetMinLbl)
        onNetMinSection.addSubview(packageOnNetMinValue)
        otherMinSection.addSubview(packageOtherMinLbl)
        otherMinSection.addSubview(packageOtherMinValue)
        smsSection.addSubview(packageSmsLbl)
        smsSection.addSubview(packageSmsValue)
        
        packageItemStackView.addArrangedSubview(dataSection)
        packageItemStackView.addArrangedSubview(onNetMinSection)
        packageItemStackView.addArrangedSubview(otherMinSection)
        packageItemStackView.addArrangedSubview(smsSection)
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            packageItemHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            packageItemHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            packageItemHeaderView.heightAnchor.constraint(equalToConstant: 280),
            
            mobilePackageTitle.topAnchor.constraint(equalTo: packageItemHeaderView.topAnchor, constant: 22),
            mobilePackageTitle.leadingAnchor.constraint(equalTo: packageItemHeaderView.leadingAnchor, constant: 30),
            
            packageValidityLbl.topAnchor.constraint(equalTo: packageItemHeaderView.topAnchor, constant: 18),
            packageValidityLbl.trailingAnchor.constraint(equalTo: packageItemHeaderView.trailingAnchor, constant: -30),
            packageValidityLbl.heightAnchor.constraint(equalToConstant: 40),
            packageValidityLbl.widthAnchor.constraint(equalToConstant: 80),
            
            packageItemContentView.leadingAnchor.constraint(equalTo: packageItemHeaderView.leadingAnchor, constant: 1),
            packageItemContentView.trailingAnchor.constraint(equalTo: packageItemHeaderView.trailingAnchor, constant: -1),
            packageItemContentView.bottomAnchor.constraint(equalTo: packageItemHeaderView.bottomAnchor, constant: -1),
            packageItemContentView.heightAnchor.constraint(equalToConstant: 207),
            
            packageItemStackView.topAnchor.constraint(equalTo: packageItemContentView.topAnchor, constant: 8),
            packageItemStackView.trailingAnchor.constraint(equalTo: packageItemContentView.trailingAnchor, constant: -16),
            packageItemStackView.leadingAnchor.constraint(equalTo: packageItemContentView.leadingAnchor, constant: 16),
            packageItemStackView.heightAnchor.constraint(equalToConstant: 60),
            
//            Stack Section
            packageDataLbl.centerYAnchor.constraint(equalTo: dataSection.centerYAnchor, constant: -10),
            packageDataLbl.leadingAnchor.constraint(equalTo: dataSection.leadingAnchor),
            packageDataValue.centerYAnchor.constraint(equalTo: dataSection.centerYAnchor, constant: 10),
            packageDataValue.leadingAnchor.constraint(equalTo: dataSection.leadingAnchor),
            
            packageOnNetMinLbl.centerYAnchor.constraint(equalTo: onNetMinSection.centerYAnchor, constant: -10),
            packageOnNetMinLbl.leadingAnchor.constraint(equalTo: onNetMinSection.leadingAnchor),
            packageOnNetMinValue.centerYAnchor.constraint(equalTo: onNetMinSection.centerYAnchor, constant: 10),
            packageOnNetMinValue.leadingAnchor.constraint(equalTo: onNetMinSection.leadingAnchor),
            
            packageOtherMinLbl.centerYAnchor.constraint(equalTo: otherMinSection.centerYAnchor, constant: -10),
            packageOtherMinLbl.leadingAnchor.constraint(equalTo: otherMinSection.leadingAnchor),
            packageOtherMinValue.centerYAnchor.constraint(equalTo: otherMinSection.centerYAnchor, constant: 10),
            packageOtherMinValue.leadingAnchor.constraint(equalTo: otherMinSection.leadingAnchor),
            
            packageSmsLbl.centerYAnchor.constraint(equalTo: smsSection.centerYAnchor, constant: -10),
            packageSmsLbl.leadingAnchor.constraint(equalTo: smsSection.leadingAnchor),
            packageSmsValue.centerYAnchor.constraint(equalTo: smsSection.centerYAnchor, constant: 10),
            packageSmsValue.leadingAnchor.constraint(equalTo: smsSection.leadingAnchor),
//            Stack Section End
            
            packageIncludesLbl.topAnchor.constraint(equalTo: packageItemStackView.bottomAnchor, constant: 3),
            packageIncludesLbl.leadingAnchor.constraint(equalTo: packageItemContentView.leadingAnchor, constant: 16),
            
            packageIncludesValue.topAnchor.constraint(equalTo: packageIncludesLbl.bottomAnchor, constant: 2),
            packageIncludesValue.leadingAnchor.constraint(equalTo: packageItemContentView.leadingAnchor, constant: 16),
            
            amountSection.topAnchor.constraint(equalTo: packageIncludesValue.bottomAnchor, constant: 20),
            amountSection.leadingAnchor.constraint(equalTo: packageItemContentView.leadingAnchor, constant: 18),
            amountSection.trailingAnchor.constraint(equalTo: packageItemContentView.trailingAnchor, constant: -18),
            amountSection.heightAnchor.constraint(equalToConstant: 60),
            
            packagePriceLbl.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor, constant: -10),
            packagePriceLbl.leadingAnchor.constraint(equalTo: amountSection.leadingAnchor, constant: 18),
            
            packagePriceValue.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor, constant: 10),
            packagePriceValue.leadingAnchor.constraint(equalTo: amountSection.leadingAnchor, constant: 18),
            
            packageSubscribeBtn.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor),
            packageSubscribeBtn.trailingAnchor.constraint(equalTo: amountSection.trailingAnchor, constant: -16),
            packageSubscribeBtn.heightAnchor.constraint(equalToConstant: 34),
            packageSubscribeBtn.widthAnchor.constraint(equalToConstant: 110)

        ])
        
    }

    func setupPackageCell(networkType: String, title: String, duration: String, data: String, OnNetMin: String, otherMin: String, sms: String, amount: String, includedValues: String) {
        mobilePackageTitle.text = title
        packageValidityLbl.text = duration
        packageDataValue.text = data
        packageOnNetMinValue.text = String(OnNetMin)
        packageOtherMinValue.text = String(otherMin)
        packageSmsValue.text = String(sms)
        packagePriceValue.text = String(amount)
        packageIncludesValue.text = includedValues
    }
}

#Preview {
    AllPackagesViewController()
}
