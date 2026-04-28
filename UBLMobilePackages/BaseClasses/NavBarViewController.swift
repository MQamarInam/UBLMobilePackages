//
//  NavBarViewController.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026.
//

import UIKit

class NavBarViewController: BaseViewController {
    
    let contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let profileBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.1), tintClr: .black, title: "", imageSize: 20, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 19)
    
    private let searchBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.1), tintClr: .black, title: "", imageSize: 18, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 19)
    
    private let backBtn = GenericButton(bgColor: .clear, tintClr: .systemBlue, title: "", imageSize: 18, labelFont: .systemFont(ofSize: 10, weight: .medium), cornrRadius: 1)

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
        
        let config = UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        profileBtn.tintColor = .black
        profileBtn.setImage(UIImage(systemName: "person")!.withConfiguration(config), for: .normal)
        searchBtn.tintColor = .black
        searchBtn.setImage(UIImage(systemName: "magnifyingglass")!.withConfiguration(config), for: .normal)
        backBtn.tintColor = .systemBlue
        backBtn.setImage(UIImage(systemName: "arrow.left")!.withConfiguration(config), for: .normal)
        
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
