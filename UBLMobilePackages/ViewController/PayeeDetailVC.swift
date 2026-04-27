//
//  PayeeDetailVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class PayeeDetailVC: HeaderTitleViewController {
    
    let gradientLayer = CAGradientLayer()
    
    private let bgView = UIView()
    private var initials = GenericLabel(myfont: .systemFont(ofSize: 25, weight: .medium), color: .white, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let editBtn = GenericButton(bgColor: .white, tintClr: .systemBlue, title: " Edit", titleImg: UIImage(systemName: "pencil")!, imageSize: 16, labelFont: .systemFont(ofSize: 16, weight: .medium), cornrRadius: 18)
    private let deleteBtn = GenericButton(bgColor: .white, tintClr: .systemRed, title: "Delete", titleImg: UIImage(systemName: "trash")!, imageSize: 20, labelFont: .systemFont(ofSize: 18, weight: .medium), cornrRadius: 16)
    private let myTitle = GenericLabel(myfont: .systemFont(ofSize: 30, weight: .medium), color: .white, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNumberLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .white, mytext: "Mobile Number", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNumber = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, mytext: "03080044493", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNetworkTypeLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .white, mytext: "Company", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myNetworkType = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payNowBtn = GenericButton(bgColor: .systemBlue, tintClr: .systemBlue, title: "Pay Now", titleImg: UIImage(systemName: "pencil")!, imageSize: 0, labelFont: .systemFont(ofSize: 18, weight: .semibold), cornrRadius: 10)
    
    var payeesModel: PayeesModel?
    var packageModel: NetworkPackageModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "Payee Detail"
        
        myTitle.text = payeesModel?.payeeName
        myNumber.text = payeesModel?.number
        myNetworkType.text = packageModel?.networkType
        
        gradientLayer.colors = [
            UIColor.orange.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
        bgView.layer.insertSublayer(gradientLayer, at: 0)
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = bgView.bounds
        gradientLayer.cornerRadius = 20
    }
    
    private func configureUI() {
        
        view.addSubview(bgView)
        view.addSubview(payNowBtn)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.layer.cornerRadius = 20
        
        editBtn.setTitleColor(.black, for: .normal)
        deleteBtn.setTitle("", for: .normal)
        
        payNowBtn.setImage(UIImage(named: ""), for: .normal)
        payNowBtn.addTarget(self, action: #selector(payNowClicked), for: .touchUpInside)
        
        initials.backgroundColor = .red
        initials.layer.cornerRadius = 25
        initials.clipsToBounds = true
        
        bgView.addSubview(initials)
        bgView.addSubview(editBtn)
        bgView.addSubview(deleteBtn)
        bgView.addSubview(myTitle)
        bgView.addSubview(myNumberLbl)
        bgView.addSubview(myNumber)
        bgView.addSubview(myNetworkTypeLbl)
        bgView.addSubview(myNetworkType)
        
        NSLayoutConstraint.activate([
            
            bgView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            bgView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            bgView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            bgView.heightAnchor.constraint(equalToConstant: 240),
            
            initials.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 22),
            initials.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            initials.heightAnchor.constraint(equalToConstant: 50),
            initials.widthAnchor.constraint(equalToConstant: 50),
            
            editBtn.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 25),
            editBtn.trailingAnchor.constraint(equalTo: deleteBtn.leadingAnchor, constant: -12),
            editBtn.heightAnchor.constraint(equalToConstant: 35),
            editBtn.widthAnchor.constraint(equalToConstant: 75),
            
            deleteBtn.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 25),
            deleteBtn.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: -25),
            deleteBtn.heightAnchor.constraint(equalToConstant: 35),
            deleteBtn.widthAnchor.constraint(equalToConstant: 35),
            
            myTitle.topAnchor.constraint(equalTo: initials.bottomAnchor, constant: 12),
            myTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            
            myNumberLbl.topAnchor.constraint(equalTo: myTitle.bottomAnchor, constant: 7),
            myNumberLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            
            myNumber.topAnchor.constraint(equalTo: myNumberLbl.bottomAnchor, constant: 2),
            myNumber.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            
            myNetworkTypeLbl.topAnchor.constraint(equalTo: myNumber.bottomAnchor, constant: 7),
            myNetworkTypeLbl.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            
            myNetworkType.topAnchor.constraint(equalTo: myNetworkTypeLbl.bottomAnchor, constant: 2),
            myNetworkType.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 25),
            
            payNowBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            payNowBtn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payNowBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payNowBtn.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        
    }
    
    @objc private func payNowClicked() {
        let vc = ReviewPaymentVC()
        vc.payeesModel = payeesModel
        vc.packageModel = packageModel
        navigationController?.pushViewController(vc, animated: true)
    }

}

#Preview {
    PayeeDetailVC()
}
