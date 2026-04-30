//
//  ReviewPaymentVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class ReviewPaymentViewController: HeaderTitleViewController {
    
//    MARK: UISection
    private let navigationIcon = GenericImage(imageName: UIImage(systemName: "chevron.right")!, contntMode: .scaleAspectFit, tintClr: .systemBlue, bgColor: .clear, cornrRadius: 1)
    private let walletImage = GenericImage(imageName: UIImage(systemName: "wallet.bifold")!, contntMode: .scaleAspectFit, tintClr: .black, bgColor: .gray.withAlphaComponent(0.3), cornrRadius: 30)
    private var payeeInitials = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .medium), color: .black, backgroundClr: .gray.withAlphaComponent(0.3), mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 27)
    private let accountLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Account", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderName = GenericLabel(myfont: .systemFont(ofSize: 19, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Qamar Inam", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderAccountNumber = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, backgroundClr: .clear, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payFromLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Pay From", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payToLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Pay To", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 19, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Qamar Inam", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeNumber = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, backgroundClr: .clear, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let mobilePackageImage = GenericImage(imageName: UIImage(systemName: "iphone.gen2.badge.play")!, contntMode: .scaleAspectFit, tintClr: .black, bgColor: .white, cornrRadius: 25)
    private let packageTitleLbl = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, backgroundClr: .clear, mytext: "Super Ghanta", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let validityLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .regular), color: .white, backgroundClr: .clear, mytext: "Validity", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let validityValue = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, backgroundClr: .clear, mytext: "30 Days", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let dateLbl = GenericLabel(myfont: .systemFont(ofSize: 15, weight: .regular), color: .white, backgroundClr: .clear, mytext: "Date", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let dateValue = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .semibold), color: .white, backgroundClr: .clear, mytext: "00/06/2000", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let priceLbl = GenericLabel(myfont: .systemFont(ofSize: 20, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Rs. 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payNowBtn: GenericButton = {
        let payNowBtn = GenericButton(bgColor: .systemBlue, tintClr: .white, title: "Pay Now", imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 12)
        payNowBtn.addTarget(self, action: #selector(payNowClicked), for: .touchUpInside)
        return payNowBtn
    }()
    private let priceSection: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray.withAlphaComponent(0.1)
        return view
    }()
    private let senderSection: UIView = {
        let senderSection = UIView()
        senderSection.backgroundColor = .gray.withAlphaComponent(0.1)
        senderSection.layer.cornerRadius = 20
        senderSection.translatesAutoresizingMaskIntoConstraints = false
        return senderSection
    }()
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .gray.withAlphaComponent(0.1)
        headerView.layer.cornerRadius = 20
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    private let paymentContentView: UIView = {
        let paymentContentView = UIView()
        paymentContentView.layer.cornerRadius = 20
        paymentContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        paymentContentView.translatesAutoresizingMaskIntoConstraints = false
        return paymentContentView
    }()
    private let paymentContentViewGradientBackground: UIView = {
        let paymentContentView = UIView()
        paymentContentView.layer.cornerRadius = 20
        paymentContentView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        paymentContentView.translatesAutoresizingMaskIntoConstraints = false
        return paymentContentView
    }()
    
//    MARK: Variables / Instances
    var payeesModel: PayeesModel?
    var packageModel: NetworkPackageModel?
    init(payeesModel: PayeesModel? = nil, packageModel: NetworkPackageModel? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.payeesModel = payeesModel
        self.packageModel = packageModel
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if paymentContentViewGradientBackground.layer.sublayers == nil && paymentContentViewGradientBackground.bounds != .zero {
            paymentContentViewGradientBackground.addGradient(colors: [
                UIColor.orange.withAlphaComponent(0.7),
                UIColor.systemPink.withAlphaComponent(0.7),
                UIColor.systemPink.withAlphaComponent(0.7)
            ], startFrom: CGPoint(x: 0, y: 0),
                                             endTo: CGPoint(x: 1, y: 1),
                                             cornerRadius: 20
            )
        }
    }
    
//    MARK: Functions
    private func configureUI() {
        titleLbl.text = "Review Payment"
        view.addSubview(payFromLbl)
        view.addSubview(payToLbl)
        view.addSubview(headerView)
        headerView.addSubview(payeeInitials)
        headerView.addSubview(payeeName)
        headerView.addSubview(payeeNumber)
        view.addSubview(senderSection)
        senderSection.addSubview(navigationIcon)
        senderSection.addSubview(accountLbl)
        senderSection.addSubview(senderName)
        senderSection.addSubview(senderAccountNumber)
        senderSection.addSubview(walletImage)
        view.addSubview(paymentContentViewGradientBackground)
        view.addSubview(paymentContentView)
        paymentContentView.addSubview(mobilePackageImage)
        paymentContentView.addSubview(packageTitleLbl)
        paymentContentView.addSubview(validityLbl)
        paymentContentView.addSubview(validityValue)
        paymentContentView.addSubview(dateLbl)
        paymentContentView.addSubview(dateValue)
        view.addSubview(priceSection)
        priceSection.addSubview(priceLbl)
        priceSection.addSubview(payNowBtn)
        
        self.payeeName.text = payeesModel?.payeeName
        self.payeeNumber.text = payeesModel?.number
        self.packageTitleLbl.text = packageModel?.title
        self.validityValue.text = packageModel?.duration
        self.priceLbl.text = "Rs. \(packageModel?.amount ?? "")"
        
        let dateString = ""
        dateValue.text = dateString.getDateInString(style: .medium)
        
        NSLayoutConstraint.activate([
            
            payFromLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            payFromLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            senderSection.topAnchor.constraint(equalTo: payFromLbl.bottomAnchor, constant: 12),
            senderSection.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            senderSection.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            senderSection.heightAnchor.constraint(equalToConstant: 95),
            
            walletImage.centerYAnchor.constraint(equalTo: senderSection.centerYAnchor),
            walletImage.leadingAnchor.constraint(equalTo: senderSection.leadingAnchor, constant: 20),
            walletImage.widthAnchor.constraint(equalToConstant: 50),
            walletImage.heightAnchor.constraint(equalToConstant: 50),
            
            accountLbl.bottomAnchor.constraint(equalTo: senderName.topAnchor, constant: -2),
            accountLbl.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            senderName.centerYAnchor.constraint(equalTo: senderSection.centerYAnchor),
            senderName.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            senderAccountNumber.topAnchor.constraint(equalTo: senderName.bottomAnchor, constant: 2),
            senderAccountNumber.leadingAnchor.constraint(equalTo: walletImage.trailingAnchor, constant: 20),
            
            navigationIcon.centerYAnchor.constraint(equalTo: senderSection.centerYAnchor),
            navigationIcon.trailingAnchor.constraint(equalTo: senderSection.trailingAnchor, constant: -15),
            navigationIcon.widthAnchor.constraint(equalToConstant: 18),
            navigationIcon.heightAnchor.constraint(equalToConstant: 18),
            
            payToLbl.topAnchor.constraint(equalTo: senderSection.bottomAnchor, constant: 25),
            payToLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            headerView.topAnchor.constraint(equalTo: payToLbl.bottomAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 310),
            
            payeeInitials.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            payeeInitials.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
            payeeInitials.heightAnchor.constraint(equalToConstant: 50),
            payeeInitials.widthAnchor.constraint(equalToConstant: 50),
            
            payeeName.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 20),
            payeeName.leadingAnchor.constraint(equalTo: payeeInitials.trailingAnchor, constant: 20),
            
            payeeNumber.topAnchor.constraint(equalTo: payeeName.bottomAnchor, constant: 2),
            payeeNumber.leadingAnchor.constraint(equalTo: payeeInitials.trailingAnchor, constant: 20),
            
            paymentContentViewGradientBackground.topAnchor.constraint(equalTo: paymentContentView.topAnchor),
            paymentContentViewGradientBackground.trailingAnchor.constraint(equalTo: paymentContentView.trailingAnchor),
            paymentContentViewGradientBackground.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor),
            paymentContentViewGradientBackground.bottomAnchor.constraint(equalTo: paymentContentView.bottomAnchor),

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
            
            validityValue.topAnchor.constraint(equalTo: validityLbl.bottomAnchor, constant: 5),
            validityValue.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            dateLbl.topAnchor.constraint(equalTo: validityValue.bottomAnchor, constant: 5),
            dateLbl.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            self.dateValue.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 5),
            self.dateValue.leadingAnchor.constraint(equalTo: paymentContentView.leadingAnchor, constant: 20),
            
            priceSection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            priceSection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            priceSection.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            priceSection.heightAnchor.constraint(equalToConstant: 100),
            
            priceLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            priceLbl.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            
            payNowBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payNowBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10),
            payNowBtn.heightAnchor.constraint(equalToConstant: 40),
            payNowBtn.widthAnchor.constraint(equalToConstant: 100),
            
        ])
    }
    
    @objc private func payNowClicked() {
        let v = ConfirmPaymentView(amount: packageModel?.amount ?? "", name: payeesModel?.payeeName ?? "", number: payeesModel?.number ?? "")
        view.addSubview(v)
        v.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            v.frame.origin.y -= self.view.frame.height
        }, completion: nil)
        
        v.navigateToRoot = {
            let controller: Array = self.navigationController!.viewControllers
            self.navigationController!.popToViewController(controller[0], animated: true)
        }
    }

}

#Preview {
    ReviewPaymentViewController()
}
