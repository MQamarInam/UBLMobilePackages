//
//  String.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 28/04/2026.
//

import Foundation

extension String {
    func getInitials() -> String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: self) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
}

extension String {
    func getDateInString(style: DateFormatter.Style) -> String? {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: Date())
    }
}
