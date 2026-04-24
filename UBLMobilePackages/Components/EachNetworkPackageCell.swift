//
//  EachNetworkPackageCell.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class EachNetworkPackageCell: UITableViewCell {
    
    private var packageTitle = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .bold), color: .white, mytext: "Super Ganta", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var durationBtn = GenericButton(bgColor: .systemRed, tintClr: .white, title: "1 Hour", titleImg: UIImage(systemName: "clock")!, imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 20)
    private var subscribeBtn = GenericButton(bgColor: .black, tintClr: .white, title: "Subscribe", titleImg: UIImage(systemName: "clock")!, imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 18)
    
    private let dataLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "Data", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var dataValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "1 GB", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let onNetMinsLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "On Net Min", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var onNetMinsValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "5000", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let otherMinsLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "Other Min", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var otherMinsValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "500", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let smsLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "SMS", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var smsValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "1000", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    
    private let packageIncludesLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .medium), color: .gray, mytext: "Package Includes", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var packageIncludesValue = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .gray, mytext: "1 GB, 500 SMS", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let amountLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .medium), color: .gray, mytext: "Amount", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private var amountValue = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .semibold), color: .black, mytext: "Rs 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    
    private let headerView = UIView()
    private let packageContentView = UIView()
    private let amountSection = UIView()
    
    static let identifier = "myIdentifier"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        
        contentView.addSubview(headerView)
        headerView.addSubview(packageContentView)
        headerView.addSubview(packageTitle)
        headerView.addSubview(durationBtn)
        packageContentView.addSubview(amountSection)
        
        packageContentView.addSubview(dataLbl)
        packageContentView.addSubview(dataValue)
        packageContentView.addSubview(onNetMinsLbl)
        packageContentView.addSubview(onNetMinsValue)
        packageContentView.addSubview(otherMinsLbl)
        packageContentView.addSubview(otherMinsValue)
        packageContentView.addSubview(smsLbl)
        packageContentView.addSubview(smsValue)
        
        packageContentView.addSubview(packageIncludesLbl)
        packageContentView.addSubview(packageIncludesValue)
        
        amountSection.addSubview(amountLbl)
        amountSection.addSubview(amountValue)
        amountSection.addSubview(subscribeBtn)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .orange.withAlphaComponent(0.8)
        headerView.layer.cornerRadius = 20
        durationBtn.setImage(UIImage(named: "person"), for: .normal)
        subscribeBtn.setImage(UIImage(named: "person"), for: .normal)

        packageContentView.translatesAutoresizingMaskIntoConstraints = false
        amountSection.translatesAutoresizingMaskIntoConstraints = false
        amountSection.backgroundColor = .gray.withAlphaComponent(0.1)
        amountSection.layer.cornerRadius = 12
        packageContentView.backgroundColor = .white
        packageContentView.layer.cornerRadius = 20
        packageContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            headerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 280),
            
            packageTitle.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 22),
            packageTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30),
            
            durationBtn.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 18),
            durationBtn.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -30),
            durationBtn.heightAnchor.constraint(equalToConstant: 40),
            durationBtn.widthAnchor.constraint(equalToConstant: 80),
            
            packageContentView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 1),
            packageContentView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -1),
            packageContentView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -1),
            packageContentView.heightAnchor.constraint(equalToConstant: 207),
            
            dataLbl.topAnchor.constraint(equalTo: packageContentView.topAnchor, constant: 16),
            dataLbl.leadingAnchor.constraint(equalTo: packageContentView.leadingAnchor, constant: 16),
            
            onNetMinsLbl.topAnchor.constraint(equalTo: packageContentView.topAnchor, constant: 16),
            onNetMinsLbl.leadingAnchor.constraint(equalTo: dataLbl.trailingAnchor, constant: 35),
            
            otherMinsLbl.topAnchor.constraint(equalTo: packageContentView.topAnchor, constant: 16),
            otherMinsLbl.leadingAnchor.constraint(equalTo: onNetMinsLbl.trailingAnchor, constant: 30),
            
            smsLbl.topAnchor.constraint(equalTo: packageContentView.topAnchor, constant: 16),
            smsLbl.leadingAnchor.constraint(equalTo: otherMinsLbl.trailingAnchor, constant: 30),
            
            dataValue.topAnchor.constraint(equalTo: dataLbl.bottomAnchor, constant: 2),
            dataValue.leadingAnchor.constraint(equalTo: dataLbl.leadingAnchor),
            
            onNetMinsValue.topAnchor.constraint(equalTo: onNetMinsLbl.bottomAnchor, constant: 2),
            onNetMinsValue.leadingAnchor.constraint(equalTo: onNetMinsLbl.leadingAnchor),
            
            otherMinsValue.topAnchor.constraint(equalTo: otherMinsLbl.bottomAnchor, constant: 2),
            otherMinsValue.leadingAnchor.constraint(equalTo: otherMinsLbl.leadingAnchor),
            
            smsValue.topAnchor.constraint(equalTo: smsLbl.bottomAnchor, constant: 2),
            smsValue.leadingAnchor.constraint(equalTo: smsLbl.leadingAnchor),
            
            packageIncludesLbl.topAnchor.constraint(equalTo: packageContentView.topAnchor, constant: 70),
            packageIncludesLbl.leadingAnchor.constraint(equalTo: packageContentView.leadingAnchor, constant: 16),
            
            packageIncludesValue.topAnchor.constraint(equalTo: packageIncludesLbl.bottomAnchor, constant: 2),
            packageIncludesValue.leadingAnchor.constraint(equalTo: packageContentView.leadingAnchor, constant: 16),
            
            amountSection.topAnchor.constraint(equalTo: packageIncludesValue.bottomAnchor, constant: 20),
            amountSection.leadingAnchor.constraint(equalTo: packageContentView.leadingAnchor, constant: 18),
            amountSection.trailingAnchor.constraint(equalTo: packageContentView.trailingAnchor, constant: -18),
            amountSection.heightAnchor.constraint(equalToConstant: 60),
            
            amountLbl.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor, constant: -10),
            amountLbl.leadingAnchor.constraint(equalTo: amountSection.leadingAnchor, constant: 18),
            
            amountValue.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor, constant: 10),
            amountValue.leadingAnchor.constraint(equalTo: amountSection.leadingAnchor, constant: 18),
            
            subscribeBtn.centerYAnchor.constraint(equalTo: amountSection.centerYAnchor),
            subscribeBtn.trailingAnchor.constraint(equalTo: amountSection.trailingAnchor, constant: -16),
            subscribeBtn.heightAnchor.constraint(equalToConstant: 34),
            subscribeBtn.widthAnchor.constraint(equalToConstant: 110)

        ])
        
    }

    func setupCell(networkType: String, title: String, duration: String, data: String, OnNetMin: String, otherMin: String, sms: String, amount: String, includedValues: String) {
        packageTitle.text = title
        durationBtn.setTitle(duration, for: .normal)
        dataValue.text = data
        onNetMinsValue.text = String(OnNetMin)
        otherMinsValue.text = String(otherMin)
        smsValue.text = String(sms)
        amountValue.text = String(amount)
        packageIncludesValue.text = includedValues
    }
    
    func setupLbl(dataLbl: String, onNetMinLbl: String, otherMin: String, smsLbl: String) {
        self.dataLbl.text = dataLbl
        self.onNetMinsLbl.text = onNetMinLbl
        self.otherMinsLbl.text = otherMin
        self.smsLbl.text = smsLbl
    }

}

#Preview {
    EachNetworkPackagesVC()
}
