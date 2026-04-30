//
//  ConfirmPaymentV.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class ConfirmPaymentView: UIView {
    
//    MARK: UISection
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    private let dismissSheetBtn: GenericButton = {
        let dismissSheetBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.3), tintClr: .black, title: "", imageSize: 14, labelFont: .systemFont(ofSize: 18), cornrRadius: 15)
        dismissSheetBtn.setImage(UIImage(systemName: "xmark"), for: .normal)
        dismissSheetBtn.tintColor = .black
        dismissSheetBtn.addTarget(self, action: #selector(dismissSheetClicked), for: .touchUpInside)
        return dismissSheetBtn
    }()
    private let confirmImage: GenericButton = {
        let confirmImage = GenericButton(bgColor: .green, tintClr: .white, title: "", imageSize: 16, labelFont: .systemFont(ofSize: 20), cornrRadius: 25)
        confirmImage.setImage(UIImage(systemName: "checkmark"), for: .normal)
        confirmImage.tintColor = .white
        return confirmImage
    }()
    private let paymentSucessfullLbl = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Payment Sucessful", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let amountSentLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Amount Sent", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let amountLbl = GenericLabel(myfont: .systemFont(ofSize: 30, weight: .bold), color: .black, backgroundClr: .clear, mytext: "Rs. 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let transactionHistoryLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Check your payment's status in Transaction History", myNumberOfLines: 2, clickable: false, txtAlignment: .center, cornerRadius: 0)
    private let dateLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, backgroundClr: .clear, mytext: "12-12-2013", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let paidToLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Paid To", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let payeeNumber = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let paidFromLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "Paid From", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderName = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, backgroundClr: .clear, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let senderAcountNumber = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, backgroundClr: .clear, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left, cornerRadius: 0)
    private let shareButton: GenericButton = {
        let shareButton = GenericButton(bgColor: .gray.withAlphaComponent(0.2), tintClr: .blue, title: " Share", imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 20)
        shareButton.setTitleColor(.black, for: .normal)
        return shareButton
    }()
    
    var navigateToRoot: (() -> Void)?
    
//    MARK: Init
    init(amount: String, name: String, number: String) {
        super.init(frame: .zero)
        self.amountLbl.text = amount
        self.payeeName.text = name
        self.payeeNumber.text = number
        self.backgroundColor = .darkGray.withAlphaComponent(0.98)
        
        self.addSubview(contentView)
        contentView.addSubview(confirmImage)
        contentView.addSubview(paymentSucessfullLbl)
        contentView.addSubview(amountSentLbl)
        contentView.addSubview(amountLbl)
        contentView.addSubview(transactionHistoryLbl)
        contentView.addSubview(dateLbl)
        contentView.addSubview(paidToLbl)
        contentView.addSubview(payeeName)
        contentView.addSubview(payeeNumber)
        contentView.addSubview(paidFromLbl)
        contentView.addSubview(senderName)
        contentView.addSubview(senderAcountNumber)
        contentView.addSubview(shareButton)
        contentView.addSubview(dismissSheetBtn)
        
        let dateString = ""
        dateLbl.text = dateString.getDateInString(style: .medium)
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 590),
            
            dismissSheetBtn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dismissSheetBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            dismissSheetBtn.heightAnchor.constraint(equalToConstant: 30),
            dismissSheetBtn.widthAnchor.constraint(equalToConstant: 30),
            
            confirmImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            confirmImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            confirmImage.heightAnchor.constraint(equalToConstant: 50),
            confirmImage.widthAnchor.constraint(equalToConstant: 50),
            
            paymentSucessfullLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paymentSucessfullLbl.topAnchor.constraint(equalTo: confirmImage.bottomAnchor, constant: 14),
            
            amountSentLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            amountSentLbl.topAnchor.constraint(equalTo: paymentSucessfullLbl.bottomAnchor, constant: 20),
            
            amountLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            amountLbl.topAnchor.constraint(equalTo: amountSentLbl.bottomAnchor, constant: 5),
            
            transactionHistoryLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            transactionHistoryLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            transactionHistoryLbl.topAnchor.constraint(equalTo: amountLbl.bottomAnchor, constant: 5),
            
            dateLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLbl.topAnchor.constraint(equalTo: transactionHistoryLbl.bottomAnchor, constant: 8),
            
            paidToLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paidToLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 15),
            
            payeeName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            payeeName.topAnchor.constraint(equalTo: paidToLbl.bottomAnchor, constant: 4),
            
            payeeNumber.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            payeeNumber.topAnchor.constraint(equalTo: payeeName.bottomAnchor, constant: 5),
            
            paidFromLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            paidFromLbl.topAnchor.constraint(equalTo: payeeNumber.bottomAnchor, constant: 15),
            
            senderName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            senderName.topAnchor.constraint(equalTo: paidFromLbl.bottomAnchor, constant: 4),
            
            senderAcountNumber.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            senderAcountNumber.topAnchor.constraint(equalTo: senderName.bottomAnchor, constant: 5),

            shareButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shareButton.topAnchor.constraint(equalTo: senderAcountNumber.bottomAnchor, constant: 15),
            shareButton.heightAnchor.constraint(equalToConstant: 40),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissSheetClicked() {
        navigateToRoot?()
    }
    
}
