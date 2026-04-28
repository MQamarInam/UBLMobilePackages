//
//  Int.swift
//  UBLMobilePackages
//
//  Created by Muhammad Qamar on 28/04/2026.
//

import Foundation
import UIKit

extension Int {
    var autoSized : CGFloat{
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        let diagonalSize = sqrt((screenWidth * screenWidth) + (screenHeight * screenHeight))
        let percentage = CGFloat(self) / 962*100
        return diagonalSize * percentage / 100
    }

    var widthRatio: CGFloat {
        let width = UIScreen.main.bounds.width/402.0
        return CGFloat(self)*width
    }
}
