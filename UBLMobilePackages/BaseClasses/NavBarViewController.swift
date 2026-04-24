//
//  NavBarViewController.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class NavBarViewController: BaseViewController {
    
    let contentView = UIView()
    
    private let profileBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.1), tintClr: .black, title: "", titleImg: UIImage(systemName: "person")!, imageSize: 20, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 19)
    
    private let searchBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.1), tintClr: .black, title: "", titleImg: UIImage(systemName: "magnifyingglass")!, imageSize: 18, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 19)
    
    private let backBtn = GenericButton(bgColor: .clear, tintClr: .systemBlue, title: "", titleImg: UIImage(systemName: "arrow.left")!, imageSize: 18, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        
        view.addSubview(contentView)
        contentView.addSubview(profileBtn)
        contentView.addSubview(searchBtn)
        contentView.addSubview(backBtn)
        backBtn.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            contentView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 42),
            
            profileBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileBtn.heightAnchor.constraint(equalToConstant: 38),
            profileBtn.widthAnchor.constraint(equalToConstant: 38),
            
            searchBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            searchBtn.leadingAnchor.constraint(equalTo: profileBtn.trailingAnchor, constant: 10),
            searchBtn.heightAnchor.constraint(equalToConstant: 38),
            searchBtn.widthAnchor.constraint(equalToConstant: 38),
            
            backBtn.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            backBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backBtn.heightAnchor.constraint(equalToConstant: 38),
            backBtn.widthAnchor.constraint(equalToConstant: 38),
            
        ])
        
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }

}

#Preview {
    NavBarViewController()
}
