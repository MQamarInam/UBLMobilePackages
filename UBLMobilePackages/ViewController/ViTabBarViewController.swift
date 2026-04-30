//
//  ViTabBarViewController.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 30/04/2026.

import UIKit

class ViTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = MobilePaymentsViewController()
        vc1.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        let vc2 = NetworksListViewController()
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 2)
        
        let vc3 = AllPackagesViewController()
        vc1.tabBarItem = UITabBarItem(title: "Internet", image: UIImage(systemName: "globe"), tag: 3)
        
        viewControllers = [vc1, vc2, vc3]
        
    }

}
