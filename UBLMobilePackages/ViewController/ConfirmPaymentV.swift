//
//  ConfirmPaymentV.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 27/04/2026.
//

import UIKit

class ConfirmPaymentV: UIView {
    
    private let contentView = UIView()

    private let dismissSheetBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.3), tintClr: .black, title: "", titleImg: UIImage(systemName: "xmark")!, imageSize: 14, labelFont: .systemFont(ofSize: 18), cornrRadius: 15)
    private let confirmImage = GenericButton(bgColor: .green, tintClr: .white, title: "", titleImg: UIImage(systemName: "checkmark")!, imageSize: 16, labelFont: .systemFont(ofSize: 20), cornrRadius: 25)
    private let paymentSucessfullLbl = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, mytext: "Payment Sucessful", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let amountSentLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "Amount Sent", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let amountLbl = GenericLabel(myfont: .systemFont(ofSize: 30, weight: .bold), color: .black, mytext: "Rs. 500", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let transactionHistoryLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .gray, mytext: "Check your payment's status in Transaction History", myNumberOfLines: 2, clickable: false, txtAlignment: .center)
    private let dateLbl = GenericLabel(myfont: .systemFont(ofSize: 16, weight: .regular), color: .black, mytext: "12-12-2013", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let paidToLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "Paid To", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payeeName = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let payeeNumber = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let paidFromLbl = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "Paid From", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let senderName = GenericLabel(myfont: .systemFont(ofSize: 24, weight: .semibold), color: .black, mytext: "Qamar", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let senderId = GenericLabel(myfont: .systemFont(ofSize: 18, weight: .regular), color: .gray, mytext: "0300000000", myNumberOfLines: 1, clickable: false, txtAlignment: .left)
    private let shareButton = GenericButton(bgColor: .gray.withAlphaComponent(0.2), tintClr: .blue, title: " Share", titleImg: UIImage(systemName: "arrow.up")!, imageSize: 0, labelFont: .systemFont(ofSize: 16, weight: .semibold), cornrRadius: 20)

    var payeesModel: PayeesModel?
    var packageModel: NetworkPackageModel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        dismissSheetBtn.addTarget(self, action: #selector(dismissSheetClicked), for: .touchUpInside)
        self.backgroundColor = .darkGray
        
        self.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 20
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
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
        contentView.addSubview(senderId)
        contentView.addSubview(shareButton)
        
        contentView.addSubview(dismissSheetBtn)
        
        shareButton.setTitleColor(.black, for: .normal)
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        self.dateLbl.text = formatter.string(from: date)
        
        amountLbl.text = packageModel?.amount
        payeeName.text = payeesModel?.payeeName
        payeeNumber.text = payeesModel?.number
        
        NSLayoutConstraint.activate([
            
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            contentView.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 530),
            
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
            
            senderId.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            senderId.topAnchor.constraint(equalTo: senderName.bottomAnchor, constant: 5),

            shareButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            shareButton.topAnchor.constraint(equalTo: senderId.bottomAnchor, constant: 15),
            shareButton.heightAnchor.constraint(equalToConstant: 40),
            shareButton.widthAnchor.constraint(equalToConstant: 100),
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissSheetClicked() {
//        self.dismiss(animated: true)
    }
    
}
