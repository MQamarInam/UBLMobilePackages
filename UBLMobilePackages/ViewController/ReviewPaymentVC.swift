//
//  ReviewPaymentVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class ReviewPaymentVC: HeaderTitleViewController {
    
    let gradientLayer = CAGradientLayer()
    
    private let myImage = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private let walletImage = GenericImage(imageName: UIImage(systemName: "wallet.bifold")!, contntMode: .scaleAspectFit, tintClr: .black, bgColor: .gray.withAlphaComponent(0.3), cornrRadius: 30)
    private var initials = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .medium), color: .black, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center)
    private let accountLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .gray, mytext: "Account", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let senderName = GenericLabel(myfont: .systemFont(ofSize: 19, weight: .semibold), color: .black, mytext: "Qamar Inam", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let senderId = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let myView = UIView()
    
    private let payFromLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "Pay From", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payToLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "Pay To", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 19, weight: .semibold), color: .black, mytext: "Qamar Inam", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payeeId = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    
    private let mobilePackageImage = GenericImage(imageName: UIImage(systemName: "iphone.gen2.badge.play")!, contntMode: .scaleAspectFit, tintClr: .black, bgColor: .white, cornrRadius: 25)
    private let packageTitleLbl = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, mytext: "Super Ghanta", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let validityLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .regular), color: .white, mytext: "Validity", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let validity = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, mytext: "30 Days", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let dateLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .regular), color: .white, mytext: "Date", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let date = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, mytext: "30/06/2003", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    
    private let priceSection = UIView()
    private let price = GenericLabel(myfont: .systemFont(ofSize: 20, weight: .semibold), color: .black, mytext: "Rs. 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payNowBtn = GenericButton(bgColor: .systemBlue, tintClr: .white, title: "Pay Now", titleImg: UIImage(systemName: "person")!, imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 12)
    
    private let headerView = UIView()
    private let paymentContentView = UIView()
    
    var payeesModel: PayeesModel?
    var packageModel: NetworkPackageModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "Review Payment"
        
        gradientLayer.colors = [
            UIColor.orange.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
        paymentContentView.layer.insertSublayer(gradientLayer, at: 0)
        
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = paymentContentView.bounds
        gradientLayer.cornerRadius = 20
    }
    
    
    private func configureUI() {
        
        view.addSubview(myView)
        view.addSubview(payFromLbl)
        view.addSubview(payToLbl)
        
        view.addSubview(headerView)
        view.addSubview(paymentContentView)
        
        myView.addSubview(myImage)
        myView.addSubview(accountLbl)
        myView.addSubview(senderName)
        myView.addSubview(senderId)
        myView.addSubview(walletImage)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.backgroundColor = .gray.withAlphaComponent(0.1)
        headerView.layer.cornerRadius = 20
        
        headerView.addSubview(initials)
        headerView.addSubview(payeeName)
        headerView.addSubview(payeeId)
        
        paymentContentView.translatesAutoresizingMaskIntoConstraints = false
        paymentContentView.layer.cornerRadius = 20
        paymentContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        paymentContentView.addSubview(mobilePackageImage)
        paymentContentView.addSubview(packageTitleLbl)
        paymentContentView.addSubview(validityLbl)
        paymentContentView.addSubview(validity)
        paymentContentView.addSubview(dateLbl)
        paymentContentView.addSubview(date)
        
        initials.backgroundColor = .gray.withAlphaComponent(0.3)
        initials.layer.cornerRadius = 27
        initials.clipsToBounds = true
        
        myView.backgroundColor = .gray.withAlphaComponent(0.1)
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.layer.cornerRadius = 20
        
        view.addSubview(priceSection)
        priceSection.translatesAutoresizingMaskIntoConstraints = false
        priceSection.backgroundColor = .gray.withAlphaComponent(0.1)
        
        priceSection.addSubview(price)
        priceSection.addSubview(payNowBtn)
        payNowBtn.setImage(UIImage(named: ""), for: .normal)
        
        self.payeeName.text = payeesModel?.payeeName
        self.payeeId.text = payeesModel?.number
        
        self.packageTitleLbl.text = packageModel?.title
        self.validity.text = packageModel?.duration
        self.price.text = "Rs. \(packageModel?.amount ?? "")"
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        self.date.text = formatter.string(from: date)
        
        payNowBtn.addTarget(self, action: #selector(payNowClicked), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            
            payFromLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            payFromLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            myView.topAnchor.constraint(equalTo: payFromLbl.bottomAnchor, constant: 12),
            myView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            myView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            myView.heightAnchor.constraint(equalToConstant: 95),
            
            walletImage.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            walletImage.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 20),
            walletImage.widthAnchor.constraint(equalToConstant: 50),
            walletImage.heightAnchor.constraint(equalToConstant: 50),
            
            accountLbl.bottomAnchor.constraint(equalTo: senderName.topAnchor, constant: -2),
            accountLbl.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            senderName.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            senderName.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            senderId.topAnchor.constraint(equalTo: senderName.bottomAnchor, constant: 2),
            senderId.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            myImage.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            myImage.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: -15),
            myImage.widthAnchor.constraint(equalToConstant: 18),
            myImage.heightAnchor.constraint(equalToConstant: 18),
            
            payToLbl.topAnchor.constraint(equalTo: myView.bottomAnchor, constant: 25),
            payToLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            headerView.topAnchor.constraint(equalTo: payToLbl.bottomAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 310),
            
            initials.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            initials.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            initials.heightAnchor.constraint(equalToConstant: 50),
            initials.widthAnchor.constraint(equalToConstant: 50),
            
            payeeName.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            payeeName.leadingAnchor.constraint(equalTo: initials.trailingAnchor, constant: 20),
            
            payeeId.topAnchor.constraint(equalTo: payeeName.bottomAnchor, constant: 2),
            payeeId.leadingAnchor.constraint(equalTo: initials.trailingAnchor, constant: 20),
            
            paymentContentView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            paymentContentView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            paymentContentView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            paymentContentView.heightAnchor.constraint(equalToConstant: 228),
            
            mobilePackageImage.topAnchor.constraint(equalTo: paymentContentView.topAnchor, constant: 20),
            mobilePackageImage.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            mobilePackageImage.heightAnchor.constraint(equalToConstant: 50),
            mobilePackageImage.widthAnchor.constraint(equalToConstant: 50),
            
            packageTitleLbl.topAnchor.constraint(equalTo: mobilePackageImage.bottomAnchor, constant: 15),
            packageTitleLbl.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            validityLbl.topAnchor.constraint(equalTo: packageTitleLbl.bottomAnchor, constant: 5),
            validityLbl.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            validity.topAnchor.constraint(equalTo: validityLbl.bottomAnchor, constant: 5),
            validity.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            dateLbl.topAnchor.constraint(equalTo: validity.bottomAnchor, constant: 5),
            dateLbl.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            self.date.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 5),
            self.date.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            priceSection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceSection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceSection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            priceSection.heightAnchor.constraint(equalToConstant: 100),
            
            price.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            price.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            
            payNowBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payNowBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            payNowBtn.heightAnchor.constraint(equalToConstant: 40),
            payNowBtn.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    @objc private func payNowClicked() {
        let vc = ConfirmPaymentV()
        vc.payeesModel = payeesModel
        vc.packageModel = packageModel
        view.addSubview(vc)
        vc.frame = view.bounds
    }

}

#Preview {
    ReviewPaymentVC()
}
