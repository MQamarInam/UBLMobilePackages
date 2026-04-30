//
//  PayeeDetailVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
// https://stackoverflow.com/questions/9844925/uiview-infinite-360-degree-rotation-animation
// https://stackoverflow.com/questions/67007905/swift-scale-transform-animation-accidentally-translates-uiview

import UIKit

class PayeeDetailViewController: HeaderTitleViewController {
    
//    MARK: UISection for Payee Detail
    private let payeeContentView: UIView = {
        let payeeContentView = UIView()
        payeeContentView.translatesAutoresizingMaskIntoConstraints = false
        payeeContentView.layer.cornerRadius = 30
        return payeeContentView
    }()
    private let payeeContentViewGradientBackground: UIView = {
        let payeeContentView = UIView()
        payeeContentView.translatesAutoresizingMaskIntoConstraints = false
        payeeContentView.layer.cornerRadius = 30
        return payeeContentView
    }()
    private var payeeNameInitialsLbl = GenericLabel(myfont: .systemFont(ofSize: 25, weight: .medium), color: .white, backgroundClr: .red, mytext: "QI", myNumberOfLines: 1, clickable: false, txtAlignment: .center, cornerRadius: 25)
    private let editPayeeDetailBtn: UIButton = {
        let editPayeeDetailBtn = GenericButton(bgColor: .white, tintClr: .systemBlue, title: " Edit", imageSize: 16, labelFont: .systemFont(ofSize: 16, weight: .medium), cornrRadius: 18)
        editPayeeDetailBtn.setTitleColor(.black, for: .normal)
        editPayeeDetailBtn.setImage(UIImage(systemName: "pencil"), for: .normal)
        editPayeeDetailBtn.addTarget(self, action: #selector(editButtonClicked), for: .touchUpInside)
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
    private let payeeNumberLbl = GenericLabel(myfont: .systemFont(ofSize: 14, weight: .regular), color: .white.withAlphaComponent(0.9), backgroundClr: .clear, mytext: "Mobile Number", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderNumberLbl = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, backgroundClr: .clear, mytext: "03080044493", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let companyNameLbl = GenericLabel(myfont: .systemFont(ofSize: 13, weight: .medium), color: .white.withAlphaComponent(0.9), backgroundClr: .clear, mytext: "Company", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let companyName = GenericLabel(myfont: .systemFont(ofSize: 17, weight: .medium), color: .white, backgroundClr: .clear, mytext: "Jazz", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    
//    MARK: UISection for Change Name
    private let payeeEditNameBackgroundView: UIView = {
        let payeeEditNameView = UIView()
        payeeEditNameView.backgroundColor = .purple
        payeeEditNameView.translatesAutoresizingMaskIntoConstraints = false
        payeeEditNameView.layer.cornerRadius = 30
        return payeeEditNameView
    }()
    private let payeeEditNameView: UIView = {
        let payeeEditNameView = UIView()
        payeeEditNameView.backgroundColor = .white
        payeeEditNameView.translatesAutoresizingMaskIntoConstraints = false
        payeeEditNameView.layer.cornerRadius = 30
        return payeeEditNameView
    }()
    private let changeNameLbl = GenericLabel(myfont: .systemFont(ofSize: 20, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Change Name", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let editPayeeNameTextField: GenericTextField = {
        let editPayeeNameTextField = GenericTextField(placeholdr: "", bgClr: .clear, txtClr: .black, cornrRadius: 1)
        editPayeeNameTextField.text = "Qamar Inam"
        return editPayeeNameTextField
    }()
    private let cancelEditingNameBtn: UIButton = {
        let cancelEditingNameBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.1), tintClr: .systemBlue, title: "Cancel", imageSize: 16, labelFont: .systemFont(ofSize: 16, weight: .medium), cornrRadius: 19)
        cancelEditingNameBtn.setTitleColor(.black, for: .normal)
//        cancelEditingNameBtn.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        return cancelEditingNameBtn
    }()
    private let doneEditingNameBtn: UIButton = {
        let doneEditingNameBtn = GenericButton(bgColor: .systemBlue, tintClr: .systemBlue, title: "Done", imageSize: 16, labelFont: .systemFont(ofSize: 16, weight: .medium), cornrRadius: 19)
        doneEditingNameBtn.setTitleColor(.white, for: .normal)
        doneEditingNameBtn.addTarget(self, action: #selector(doneButtonClicked), for: .touchUpInside)
        return doneEditingNameBtn
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
        if payeeContentViewGradientBackground.layer.sublayers == nil && payeeContentViewGradientBackground.bounds != .zero {
            payeeContentViewGradientBackground.addGradient(
                colors: [
                UIColor.orange.withAlphaComponent(0.7),
                UIColor.systemPink.withAlphaComponent(0.7),
                UIColor.systemPink.withAlphaComponent(0.7)
            ],  startFrom: CGPoint(x: 0, y: 0),
                endTo: CGPoint(x: 1, y: 1),
                cornerRadius: 30
            )
        }
    }
    
//    MARK: Functions
    private func configureUI() {
        titleLbl.text = "Payee Detail"
        view.addSubview(payeeContentViewGradientBackground)
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
        
        view.addSubview(payeeEditNameBackgroundView)
        payeeEditNameBackgroundView.addSubview(payeeEditNameView)
        payeeEditNameView.addSubview(changeNameLbl)
        payeeEditNameView.addSubview(editPayeeNameTextField)
        payeeEditNameView.addSubview(cancelEditingNameBtn)
        payeeEditNameView.addSubview(doneEditingNameBtn)
        
        payeeEditNameBackgroundView.layer.opacity = 0
        
//      UI elements like labels are typically nil until the view is loaded, so we cannot assign to payeeName.text directly inside the init.
        payeeName.text = payeesModel?.payeeName
        senderNumberLbl.text = payeesModel?.number
        companyName.text = packageModel?.networkType
        
        NSLayoutConstraint.activate([
            
//            MARK: Detail Section Constraints
            payeeContentViewGradientBackground.topAnchor.constraint(equalTo: payeeContentView.topAnchor),
            payeeContentViewGradientBackground.trailingAnchor.constraint(equalTo: payeeContentView.trailingAnchor),
            payeeContentViewGradientBackground.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor),
            payeeContentViewGradientBackground.bottomAnchor.constraint(equalTo: payeeContentView.bottomAnchor),
            
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
            
            senderNumberLbl.topAnchor.constraint(equalTo: payeeNumberLbl.bottomAnchor),
            senderNumberLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            companyNameLbl.topAnchor.constraint(equalTo: senderNumberLbl.bottomAnchor, constant: 7),
            companyNameLbl.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            companyName.topAnchor.constraint(equalTo: companyNameLbl.bottomAnchor),
            companyName.leadingAnchor.constraint(equalTo: payeeContentView.leadingAnchor, constant: 25),
            
            payNowBtn.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            payNowBtn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payNowBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payNowBtn.heightAnchor.constraint(equalToConstant: 45),
            
//            MARK: Edit Section Constraints
            payeeEditNameBackgroundView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            payeeEditNameBackgroundView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payeeEditNameBackgroundView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payeeEditNameBackgroundView.heightAnchor.constraint(equalToConstant: 240),
            
            payeeEditNameView.topAnchor.constraint(equalTo: payeeEditNameBackgroundView.topAnchor, constant: 2),
            payeeEditNameView.trailingAnchor.constraint(equalTo: payeeEditNameBackgroundView.trailingAnchor, constant: -2),
            payeeEditNameView.leadingAnchor.constraint(equalTo: payeeEditNameBackgroundView.leadingAnchor, constant: 2),
            payeeEditNameView.bottomAnchor.constraint(equalTo: payeeEditNameBackgroundView.bottomAnchor, constant: -2),
            
            changeNameLbl.centerYAnchor.constraint(equalTo: payeeEditNameView.centerYAnchor, constant: -20),
            changeNameLbl.leadingAnchor.constraint(equalTo: payeeEditNameView.leadingAnchor, constant: 25),
            
            editPayeeNameTextField.centerYAnchor.constraint(equalTo: payeeEditNameView.centerYAnchor, constant: 12),
            editPayeeNameTextField.leadingAnchor.constraint(equalTo: payeeEditNameView.leadingAnchor, constant: 25),
            editPayeeNameTextField.trailingAnchor.constraint(equalTo: payeeEditNameView.trailingAnchor, constant: -25),
            editPayeeNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            cancelEditingNameBtn.bottomAnchor.constraint(equalTo: payeeEditNameView.bottomAnchor, constant: -20),
            cancelEditingNameBtn.leadingAnchor.constraint(equalTo: payeeEditNameView.leadingAnchor, constant: 25),
            cancelEditingNameBtn.heightAnchor.constraint(equalToConstant: 38),
            cancelEditingNameBtn.widthAnchor.constraint(equalToConstant: 100),
            
            doneEditingNameBtn.bottomAnchor.constraint(equalTo: payeeEditNameView.bottomAnchor, constant: -20),
            doneEditingNameBtn.leadingAnchor.constraint(equalTo: cancelEditingNameBtn.trailingAnchor, constant: 10),
            doneEditingNameBtn.heightAnchor.constraint(equalToConstant: 38),
            doneEditingNameBtn.widthAnchor.constraint(equalToConstant: 100),
            
            
            
        ])
        
    }
    
    @objc private func payNowClicked() {
        let vc = ReviewPaymentViewController(payeesModel: payeesModel, packageModel: packageModel)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func editButtonClicked() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.payeeEditNameBackgroundView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.payeeContentViewGradientBackground.transform = CGAffineTransform(1.1, 1, 1, 1, 100, 0)
            self.payeeContentView.transform = CGAffineTransform(1.1, 1, 1.1, 1, 100, 0)
            self.payeeEditNameBackgroundView.layer.opacity = 1
            self.payeeContentViewGradientBackground.layer.opacity = 0
            self.payeeContentView.layer.opacity = 0
        }
    }
    
//    @objc private func cancelButtonClicked() {
//        UIView.animate(withDuration: 0.3, delay: 0) {
//            self.payeeEditNameBackgroundView.transform = CGAffineTransform(1.2, 1.2, 1, 1.2, 0, 0)
//            self.payeeContentViewGradientBackground.transform = CGAffineTransform(scaleX: 1, y: 1)
//            self.payeeContentView.transform = CGAffineTransform(scaleX: 1, y: 1)
//            self.payeeEditNameBackgroundView.layer.opacity = 0
//            self.payeeContentViewGradientBackground.layer.opacity = 1
//            self.payeeContentView.layer.opacity = 1
//        }
//    }
    
    @objc private func doneButtonClicked() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.payeeEditNameBackgroundView.transform = CGAffineTransform(1.1, 1, 1.1, 1, 100, 0)
            self.payeeContentViewGradientBackground.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.payeeContentView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.payeeEditNameBackgroundView.layer.opacity = 0
            self.payeeContentViewGradientBackground.layer.opacity = 1
            self.payeeContentView.layer.opacity = 1
            self.payeeName.text = self.editPayeeNameTextField.text
        }
    }

}

//CGAffineTransformRotate(.init(scaleX: 1, y: 1), 90)

#Preview {
    PayeeDetailViewController()
}

//extension PayeeDetailViewController {
    //@objc private func editButtonClicked() {
    //    UIView.animate(withDuration: 0.3, delay: 0) {
    //        self.payeeEditNameBackgroundView.transform = CGAffineTransform(scaleX: 1, y: 1)
    //        self.payeeContentViewGradientBackground.transform = CGAffineTransform(scaleX: 0.4, y: 1)
    //        self.payeeContentView.transform = CGAffineTransform(scaleX: 0.4, y: 1)
    //        self.payeeEditNameBackgroundView.layer.opacity = 1
    //        self.payeeContentViewGradientBackground.layer.opacity = 0
    //        self.payeeContentView.layer.opacity = 0
    //    }
    //}
    //@objc private func doneButtonClicked() {
    //    UIView.animate(withDuration: 0.3, delay: 0) {
    //        self.payeeEditNameBackgroundView.transform = CGAffineTransform(scaleX: 0.4, y: 1)
    //        self.payeeContentViewGradientBackground.transform = CGAffineTransform(scaleX: 1, y: 1)
    //        self.payeeContentView.transform = CGAffineTransform(scaleX: 1, y: 1)
    //        self.payeeEditNameBackgroundView.layer.opacity = 0
    //        self.payeeContentViewGradientBackground.layer.opacity = 1
    //        self.payeeContentView.layer.opacity = 1
    //        self.payeeName.text = self.editPayeeNameTextField.text
    //    }
    //}
//}
