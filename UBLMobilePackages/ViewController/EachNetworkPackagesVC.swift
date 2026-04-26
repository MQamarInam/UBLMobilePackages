//
//  EachNetworkPackagesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class EachNetworkPackagesVC: HeaderTitleViewController {
    
    private let segmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["All", "7 Days", "15 Days", "30 Days"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let myTable: UITableView = {
        let myTable = UITableView()
        myTable.rowHeight = 295
        myTable.allowsSelection = true
        myTable.register(EachNetworkPackageCell.self, forCellReuseIdentifier: EachNetworkPackageCell.identifier)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        return myTable
    }()
    
    private let vm = EachNetworkPackagesVM()
    
    var titleShown: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLbl.text = "\(self.titleShown ?? "") Packages"
        configureUI()
        myTable.dataSource = self
        myTable.delegate = self
        myTable.separatorStyle = .none
        myTable.showsVerticalScrollIndicator = false
    }
    
    func configureUI() {
        
        view.addSubview(myTable)
        view.addSubview(segmentedControl)
    
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            
            segmentedControl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40),
            
            myTable.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 25),
            myTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            myTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            myTable.bottomAnchor.constraint(equalTo: view .bottomAnchor),
            
        ])
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        
        vm.filterArray(selectedIndex: sender.selectedSegmentIndex)
        myTable.reloadData()
        
    }

}

#Preview {
    EachNetworkPackagesVC()
}

extension EachNetworkPackagesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.filteredArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTable.dequeueReusableCell(withIdentifier: EachNetworkPackageCell.identifier, for: indexPath) as? EachNetworkPackageCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        var item = vm.filteredArray[indexPath.row]
        
        var dataLbl = "Data"
        var onNetLbl = "OnNet Min"
        var OtherLbl = "Other Min"
        var smsLbl = "SMS"
        
        if item.data == "0" {
            item.data = ""
            dataLbl = ""
        }
        if item.onNetMin == "0" {
            item.onNetMin = ""
            onNetLbl = ""
        }
        if item.otherMin == "0" {
            item.otherMin = ""
            OtherLbl = ""
        }
        if item.sms == "0" {
            item.sms = ""
            smsLbl = ""
        }
        
        let includedItems = "\(item.data ?? "") \(item.onNetMin ?? "") \(onNetLbl.first ?? ",") \(item.otherMin ?? "") \(onNetLbl.first ?? " ") \(item.sms ?? "") \(onNetLbl.first ?? " ")"
        
        cell.setupLbl(dataLbl: dataLbl, onNetMinLbl: onNetLbl, otherMin: OtherLbl, smsLbl: smsLbl)
        
        cell.setupCell(networkType: item.networkType, title: item.title, duration: item.duration, data: item.data ?? "", OnNetMin: item.onNetMin ?? "", otherMin: item.otherMin ?? "", sms: item.sms ?? "", amount: "Rs. \(item.amount)", includedValues: includedItems)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PayeesVC()
        
        navigationController?.pushViewController(vc, animated: true)
        myTable.deselectRow(at: indexPath, animated: true)
    }
    
}
