//
//  HeaderTitleViewController.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class HeaderTitleViewController: NavBarViewController {

    var titleLbl = GenericLabel(myfont: .systemFont(ofSize: 36, weight: .bold), color: .black, mytext: "Mobile Payments", myNumberOfLines: 2, clickable: false, txtAlignment: .left)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        
        view.addSubview(titleLbl)
        
        NSLayoutConstraint.activate([
            
            titleLbl.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 20),
            titleLbl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
            
        ])
        
    }

}

#Preview {
    HeaderTitleViewController()
}
