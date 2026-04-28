//
//  EachNetworkPackagesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class AllPackagesViewController: HeaderTitleViewController {
    
    private let packageDurationSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["All", "7 Days", "15 Days", "30 Days"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let packagesTableView: UITableView = {
        let myTable = UITableView()
        myTable.rowHeight = 295
        myTable.allowsSelection = true
        myTable.separatorStyle = .none
        myTable.showsVerticalScrollIndicator = false
        myTable.register(EachNetworkPackageCell.self, forCellReuseIdentifier: EachNetworkPackageCell.identifier)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        return myTable
    }()
    
    private let vm = EachNetworkPackagesVM()
    
    var headerTitleLbl: String?
    init(headerTitleLbl: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.headerTitleLbl = headerTitleLbl
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "\(self.headerTitleLbl ?? "") Packages"
        configureUI()
    }
    
    func configureUI() {
        
        view.addSubview(packagesTableView)
        view.addSubview(packageDurationSegmentedControl)
        packagesTableView.dataSource = self
        packagesTableView.delegate = self
        
        vm.filterNetworkPackages(selectedIndex: 0, selectedNetwork: self.headerTitleLbl ?? "")
        
        NSLayoutConstraint.activate([
            
            packageDurationSegmentedControl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            packageDurationSegmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            packageDurationSegmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            packageDurationSegmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            packagesTableView.topAnchor.constraint(equalTo: packageDurationSegmentedControl.bottomAnchor, constant: 25),
            packagesTableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            packagesTableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            packagesTableView.bottomAnchor.constraint(equalTo: view .bottomAnchor),
            
        ])
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        
        vm.filterNetworkPackages(selectedIndex: sender.selectedSegmentIndex, selectedNetwork: self.headerTitleLbl ?? "")
        packagesTableView.reloadData()
        
    }

}

#Preview {
    AllPackagesViewController()
}

extension AllPackagesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.filteredNetworkPackages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = packagesTableView.dequeueReusableCell(withIdentifier: EachNetworkPackageCell.identifier, for: indexPath) as? EachNetworkPackageCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        var item = vm.filteredNetworkPackages[indexPath.row]
        
        var dataLbl = "Data"
        var onNetLbl = "OnNet Min"
        var OtherLbl = "Other Min"
        var smsLbl = "SMS"
        
        var includedDataLbl = ", "
        var includedOnNetLbl = "OnNet, "
        var includedOtherLbl = "Other, "
        var includedSmsLbl = "SMS"
        
        if item.data == "0" {
            item.data = ""
            dataLbl = ""
            includedDataLbl = ""
        }
        if item.onNetMin == "0" {
            item.onNetMin = ""
            onNetLbl = ""
            includedOnNetLbl = ""
        }
        if item.otherMin == "0" {
            item.otherMin = ""
            OtherLbl = ""
            includedOtherLbl = ""
        }
        if item.sms == "0" {
            item.sms = ""
            smsLbl = ""
            includedSmsLbl = ""
        }
        
        let includedItems = "\(item.data ?? "") \(includedDataLbl) \(item.onNetMin ?? "") \(includedOnNetLbl) \(item.otherMin ?? "") \(includedOtherLbl) \(item.sms ?? "") \(includedSmsLbl)"
        
        cell.setupLbl(dataLbl: dataLbl, onNetMinLbl: onNetLbl, otherMin: OtherLbl, smsLbl: smsLbl)
        
        cell.setupPackageCell(networkType: item.networkType, title: item.title, duration: item.duration, data: item.data ?? "", OnNetMin: item.onNetMin ?? "", otherMin: item.otherMin ?? "", sms: item.sms ?? "", amount: "Rs. \(item.amount)", includedValues: includedItems)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vm.filteredNetworkPackages[indexPath.row]
        let vc = PayeesViewController(packageModel: item)
        navigationController?.pushViewController(vc, animated: true)
        packagesTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
