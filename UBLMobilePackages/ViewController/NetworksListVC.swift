//
//  MobilePackagesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class NetworksListVC: HeaderTitleViewController {

    private let myTable: UITableView = {
        let myTable = UITableView()
        myTable.rowHeight = UITableView.automaticDimension
        myTable.allowsSelection = true
        myTable.register(NetworkItemCell.self, forCellReuseIdentifier: NetworkItemCell.identifier)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        return myTable
    }()
    
    private let vc = NetworksListVM()
    
    var titleShown: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        titleLbl.text = self.titleShown
        myTable.dataSource = self
        myTable.delegate = self
        myTable.rowHeight = 100
        myTable.showsVerticalScrollIndicator = false
        myTable.separatorStyle = .none
    }
    
    func configureUI() {
        view.addSubview(myTable)
        
        NSLayoutConstraint.activate([
            myTable.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            myTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            myTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            myTable.bottomAnchor.constraint(equalTo: view .bottomAnchor),
        ])
    }

}

#Preview {
    NetworksListVC()
}

extension NetworksListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vc.networkTypeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTable.dequeueReusableCell(withIdentifier: NetworkItemCell.identifier, for: indexPath) as? NetworkItemCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        let item = vc.networkTypeArray[indexPath.row]
        cell.setupCell (
            title: item.name
        )
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vc.networkTypeArray[indexPath.row]
        let vc = EachNetworkPackagesVC()
        vc.titleShown = item.name
        navigationController?.pushViewController(vc, animated: true)
        myTable.deselectRow(at: indexPath, animated: true)
    }
    
}
