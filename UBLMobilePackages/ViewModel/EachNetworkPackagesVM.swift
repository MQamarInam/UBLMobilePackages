//
//  MobilePaymentsVM.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 24/04/2026.
//

import Foundation

class EachNetworkPackagesVM {
        
    let networkPackagesArray: [NetworkPackageModel] = [
        NetworkPackageModel(networkType: "Jazz", title: "Student Bundle", duration: "15 Days", data: "15 GB", onNetMin: "500", otherMin: "100", sms: "1000", amount: "1000"),
        NetworkPackageModel(networkType: "Jazz", title: "Monthly Premium", duration: "30 Days", data: "50 GB", onNetMin: "0", otherMin: "0", sms: "1000", amount: "2500"),
        NetworkPackageModel(networkType: "Ufone", title: "Super", duration: "7 Days", data: "5 GB", onNetMin: "1000", otherMin: "100", sms: "0", amount: "2000"),
        NetworkPackageModel(networkType: "Jazz", title: "Weekly Offer", duration: "7 Days", data: "0", onNetMin: "500", otherMin: "50", sms: "1000", amount: "1500"),
        NetworkPackageModel(networkType: "Ufone", title: "Super", duration: "15 Days", data: "15 GB", onNetMin: "2000", otherMin: "0", sms: "0", amount: "2100"),
        NetworkPackageModel(networkType: "Ufone", title: "Super", duration: "30 Days", data: "25 GB", onNetMin: "5000", otherMin: "200", sms: "1000", amount: "2800"),
    ]
    
    var filteredArray: [NetworkPackageModel] = []
    
    func filterArray(selectedIndex: Int, selectedNetwork: String) {
        filteredArray = networkPackagesArray.filter { item in
            if item.networkType != selectedNetwork {
                return false
            }
            switch selectedIndex {
            case 0:
                return true
            case 1:
                return item.duration.contains("7")
            case 2:
                return item.duration.contains("15")
            case 3:
                return item.duration.contains("30")
            default:
                return true
            }
        }
    }
    
}
