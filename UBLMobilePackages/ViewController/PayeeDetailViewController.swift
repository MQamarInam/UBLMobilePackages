//
//  PayeeDetailVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class PayeeDetailViewController: HeaderTitleViewController {
    
    let gradientLayer = CAGradientLayer()
    
    private let payeeContentView: UIView = {
        let payeeContentView = UIView()
        payeeContentView.translatesAutoresizingMaskIntoConstraints = false
        payeeContentView.layer.cornerRadius = 20
        return payeeContentView
    }()
    
    private var payeeNameInitialsLbl = GenericLabel(myfont: .systemFont(ofSize: 25, weight: .medium), color: .white, backgroundClr: .red, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 25)
    
    private let editPayeeDetailBtn: UIButton = {
        let editPayeeDetailBtn = GenericButton(bgColor: .white, tintClr: .systemBlue, title: " Edit", imageSize: 16, labelFont: .systemFont(ofSize: 16, weight: .medium), cornrRadius: 18)
        editPayeeDetailBtn.setTitleColor(.black, for: .normal)
        editPayeeDetailBtn.setImage(UIImage(systemName: "pencil"), for: .normal)
        return editPayeeDetailBtn
    }()
    
    private let deletePayeeDetailBtn: UIButton = {
        let deletePayeeDetailBtn = GenericButton(bgColor: .white, tintClr: .systemRed, title: "Delete", imageSize: 20, labelFont: .systemFont(ofSize: 18, weight: .medium), cornrRadius: 16)
        deletePayeeDetailBtn.setTitle("", for: .normal)
        deletePayeeDetailBtn.setImage(UIImage(systemName: "trash"), for: .normal)
        deletePayeeDetailBtn.tintColor = .red
        return deletePayeeDetailBtn
    }()
    
    private let payNowBtn: UIButton = {
        let payNowBtn = GenericButton(bgColor: .systemBlue, tintClr: .systemBlue, title: "Pay Now", imageSize: 0, labelFont: .systemFont(ofSize: 18, weight: .semibold), cornrRadius: 10)
        payNowBtn.addTarget(self, action: #selector(payNowClicked), for: .touchUpInside)
        return payNowBtn
    }()
    
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 30, weight: .medium), color: .white, backgroundClr: .clear, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeNumberLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .white, backgroundClr: .clear, mytext: "Mobile Number", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderNumberLbl = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, backgroundClr: .clear, mytext: "03080044493", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let companyNameLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .medium), color: .white, backgroundClr: .clear, mytext: "Company", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let companyName = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, backgroundClr: .clear, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    
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
        gradientLayer.frame = payeeContentView.bounds
        gradientLayer.cornerRadius = 20
    }
    
    private func configureUI() {
        titleLbl.text = "Payee Detail"
        view.addSubview(payeeContentView)
        view.addSubview(payNowBtn)
        payeeContentView.addSubview(payeeNameInitialsLbl)
        payeeContentView.addSubview(editPayeeDetailBtn)
        payeeContentView.addSubview(deletePayeeDetailBtn)
        payeeContentView.addSubview(payeeName)
        payeeContentView.addSubview(payeeNumberLbl)
        payeeContentView.addSubview(senderNumberLbl)
        payeeContentView.addSubview(companyNameLbl)
        payeeContentView.addSubview(companyName)
        
        payeeName.text = payeesModel?.payeeName
        senderNumberLbl.text = payeesModel?.number
        companyName.text = packageModel?.networkType
        
        gradientLayer.colors = [
            UIColor.orange.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor,
            UIColor.systemPink.withAlphaComponent(0.7).cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint   = CGPoint(x: 1, y: 1)
        payeeContentView.layer.insertSublayer(gradientLayer, at: 0)
        
        NSLayoutConstraint.activate([
            
            payeeContentView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            payeeContentView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payeeContentView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payeeContentView.heightAnchor.constraint(equalToConstant: 240),
            
            payeeNameInitialsLbl.topAnchor.constraint(equalTo: payeeContentView.topAnchor, constant: 22),
            payeeNameInitialsLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            payeeNameInitialsLbl.heightAnchor.constraint(equalToConstant: 50),
            payeeNameInitialsLbl.widthAnchor.constraint(equalToConstant: 50),
            
            editPayeeDetailBtn.topAnchor.constraint(equalTo: payeeContentView.topAnchor, constant: 25),
            editPayeeDetailBtn.trailingAnchor.constraint(equalTo: deletePayeeDetailBtn.leadingAnchor, constant: -12),
            editPayeeDetailBtn.heightAnchor.constraint(equalToConstant: 35),
            editPayeeDetailBtn.widthAnchor.constraint(equalToConstant: 75),
            
            deletePayeeDetailBtn.topAnchor.constraint(equalTo: payeeContentView.topAnchor, constant: 25),
            deletePayeeDetailBtn.trailingAnchor.constraint(equalTo: payeeContentView.trailingAnchor, constant: -25),
            deletePayeeDetailBtn.heightAnchor.constraint(equalToConstant: 35),
            deletePayeeDetailBtn.widthAnchor.constraint(equalToConstant: 35),
            
            payeeName.topAnchor.constraint(equalTo: payeeNameInitialsLbl.bottomAnchor, constant: 12),
            payeeName.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            payeeNumberLbl.topAnchor.constraint(equalTo: payeeName.bottomAnchor, constant: 7),
            payeeNumberLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            senderNumberLbl.topAnchor.constraint(equalTo: payeeNumberLbl.bottomAnchor, constant: 2),
            senderNumberLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            companyNameLbl.topAnchor.constraint(equalTo: senderNumberLbl.bottomAnchor, constant: 7),
            companyNameLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            companyName.topAnchor.constraint(equalTo: companyNameLbl.bottomAnchor, constant: 2),
            companyName.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            payNowBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            payNowBtn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payNowBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payNowBtn.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        
    }
    
    @objc private func payNowClicked() {
        let vc = ReviewPaymentVC(payeesModel: payeesModel, packageModel: packageModel)
        navigationController?.pushViewController(vc, animated: true)
    }

}

#Preview {
    PayeeDetailViewController()
}
