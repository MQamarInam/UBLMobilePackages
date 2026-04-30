//
//  MobilePaymentsVC.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 23/04/2026

import UIKit

class MobilePaymentsViewController: HeaderTitleViewController {
    
    private let paymentTypesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let paymentTypesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        paymentTypesCollectionView.register(PaymentsItemCell.self, forCellWithReuseIdentifier: PaymentsItemCell.identifier)
        paymentTypesCollectionView.allowsSelection = true
        paymentTypesCollectionView.alwaysBounceVertical = true
        paymentTypesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        return paymentTypesCollectionView
    }()
    
    private let vm = MobilePaymentsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(paymentTypesCollectionView)
        paymentTypesCollectionView.dataSource = self
        paymentTypesCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            
            paymentTypesCollectionView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 25),
            paymentTypesCollectionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            paymentTypesCollectionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            paymentTypesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }

}

#Preview {
    MobilePaymentsViewController()
}

extension MobilePaymentsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.mobilePaymentsArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentsItemCell.identifier, for: indexPath) as! PaymentsItemCell
        let item = vm.mobilePaymentsArray[indexPath.row]
        cell.setupPaymentCell(
            image: item.image,
            title: item.title
        )
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = vm.mobilePaymentsArray[indexPath.row]
        let vc = NetworksListViewController(title: item.title)
        navigationController?.pushViewController(vc, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
}

extension MobilePaymentsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (view.frame.width / 2) - 24
        return CGSize(width: size, height: 140)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
