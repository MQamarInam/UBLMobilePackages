//
//  PayeesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class PayeesVC: HeaderTitleViewController {
    
    private let addBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.2), tintClr: .systemBlue, title: "Add", titleImg: UIImage(systemName: "plus")!, imageSize: 20, labelFont: .systemFont(ofSize: 18, weight: .medium), cornrRadius: 18)

    private let myTable: UITableView = {
        let myTable = UITableView()
        myTable.rowHeight = UITableView.automaticDimension
        myTable.allowsSelection = true
        myTable.register(PayeesItemCell.self, forCellReuseIdentifier: PayeesItemCell.identifier)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        return myTable
    }()
    
    private let vc = PayeesVM()
    var packageModel: NetworkPackageModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addBtn.setTitleColor(.black, for: .normal)
        titleLbl.text = "Mobile Payees"
        myTable.dataSource = self
        myTable.delegate = self
        myTable.rowHeight = 110
        myTable.showsVerticalScrollIndicator = false
        myTable.separatorStyle = .none
    }
    
    func configureUI() {
        
        view.addSubview(addBtn)
        view.addSubview(myTable)
        
        NSLayoutConstraint.activate([
            
            addBtn.bottomAnchor.constraint(equalTo: myTable.topAnchor, constant: -30),
            addBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addBtn.heightAnchor.constraint(equalToConstant: 35),
            addBtn.widthAnchor.constraint(equalToConstant: 75),
            
            myTable.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            myTable.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            myTable.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            myTable.bottomAnchor.constraint(equalTo: view .bottomAnchor)
            
        ])
    }

}

#Preview {
    PayeesVC()
}

extension PayeesVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vc.PayeesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTable.dequeueReusableCell(withIdentifier: PayeesItemCell.identifier, for: indexPath) as? PayeesItemCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        let item = vc.PayeesArray[indexPath.row]
        cell.setupCell(
            initials: vc.getInitials(from: item.payeeName),
            title: item.payeeName,
            number: item.number,
            networkType: packageModel?.networkType ?? ""
        )
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vc.PayeesArray[indexPath.row]
        let vc = PayeeDetailVC()
        vc.payeesModel = item
        vc.packageModel = packageModel
        navigationController?.pushViewController(vc, animated: true)
        myTable.deselectRow(at: indexPath, animated: true)
    }
    
}
