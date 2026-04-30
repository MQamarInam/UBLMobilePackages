//
//  MobilePackagesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class NetworksListViewController: HeaderTitleViewController {

    private let companiesTableView: UITableView = {
        let companiesTableView = UITableView()
        companiesTableView.allowsSelection = true
        companiesTableView.register(NetworkItemCell.self, forCellReuseIdentifier: NetworkItemCell.identifier)
        companiesTableView.rowHeight = 100
        companiesTableView.showsVerticalScrollIndicator = false
        companiesTableView.separatorStyle = .none
        companiesTableView.translatesAutoresizingMaskIntoConstraints = false
        return companiesTableView
    }()
    
    private let vm = NetworksListViewModel()
    
    var headerTitleLbl: String?
    init(title: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.headerTitleLbl = title
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        
        titleLbl.text = self.headerTitleLbl
        view.addSubview(companiesTableView)
        companiesTableView.dataSource = self
        companiesTableView.delegate = self
        
        NSLayoutConstraint.activate([
            companiesTableView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            companiesTableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            companiesTableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            companiesTableView.bottomAnchor.constraint(equalTo: view .bottomAnchor),
        ])
    }

}

#Preview {
    NetworksListViewController()
}

extension NetworksListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.networkTypeArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = companiesTableView.dequeueReusableCell(withIdentifier: NetworkItemCell.identifier, for: indexPath) as? NetworkItemCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        let item = vm.networkTypeArray[indexPath.row]
        cell.setupCompanyCell (
            title: item.name
        )
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vm.networkTypeArray[indexPath.row]
        let vc = AllPackagesViewController(headerTitleLbl: item.name)
        navigationController?.pushViewController(vc, animated: true)
        companiesTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
