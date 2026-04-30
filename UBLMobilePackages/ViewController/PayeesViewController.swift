//
//  PayeesVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import UIKit

class PayeesViewController: HeaderTitleViewController {
    
    private let addPayeeBtn: UIButton = {
        let addPayeeBtn = GenericButton(bgColor: .gray.withAlphaComponent(0.2), tintClr: .systemBlue, title: "Add", imageSize: 20, labelFont: .systemFont(ofSize: 18, weight: .medium), cornrRadius: 18)
        addPayeeBtn.setTitleColor(.black, for: .normal)
        addPayeeBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        return addPayeeBtn
    }()
    private let payeesListTableView: UITableView = {
        let myTable = UITableView()
        myTable.allowsSelection = true
        myTable.rowHeight = 110
        myTable.showsVerticalScrollIndicator = false
        myTable.separatorStyle = .none
        myTable.register(PayeesItemCell.self, forCellReuseIdentifier: PayeesItemCell.identifier)
        myTable.translatesAutoresizingMaskIntoConstraints = false
        return myTable
    }()
    
    private let vm = PayeesViewModel()
    
    var packageModel: NetworkPackageModel?
    init(packageModel: NetworkPackageModel? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.packageModel = packageModel
    }
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        titleLbl.text = "Mobile Payees"
        view.addSubview(addPayeeBtn)
        view.addSubview(payeesListTableView)
        payeesListTableView.dataSource = self
        payeesListTableView.delegate = self
        
        NSLayoutConstraint.activate([
            
            addPayeeBtn.bottomAnchor.constraint(equalTo: payeesListTableView.topAnchor, constant: -30),
            addPayeeBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            addPayeeBtn.heightAnchor.constraint(equalToConstant: 35),
            addPayeeBtn.widthAnchor.constraint(equalToConstant: 75),
            
            payeesListTableView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            payeesListTableView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            payeesListTableView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            payeesListTableView.bottomAnchor.constraint(equalTo: view .bottomAnchor)
            
        ])
    }

}

#Preview {
    PayeesViewController()
}

extension PayeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.payeesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = payeesListTableView.dequeueReusableCell(withIdentifier: PayeesItemCell.identifier, for: indexPath) as? PayeesItemCell else {
            fatalError("Error while dequeue the custom cell...")
        }
        let item = vm.payeesArray[indexPath.row]
        cell.setupPayeeCell(
            title: item.payeeName,
            number: item.number,
            networkType: packageModel?.networkType ?? ""
        )
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = vm.payeesArray[indexPath.row]
        let vc = PayeeDetailViewController(payeesModel: item, packageModel: packageModel)
        navigationController?.pushViewController(vc, animated: true)
        payeesListTableView.deselectRow(at: indexPath, animated: true)
    }
    
}
