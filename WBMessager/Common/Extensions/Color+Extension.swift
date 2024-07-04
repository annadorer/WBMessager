//
//  Color+Extension.swift
//  WBMessager
//
//  Created by Anna on 03.07.2024.
//

import SwiftUI

extension Color {
    
static let designColor = DesignColor()
    
    struct DesignColor {
        let actionButton = Color("ActionButtonColor")
        let actionButtonText = Color("ActionButtonTextColor")
        let appBackground = Color("AppBackgroundColor")
        let appSecondaryBackground = Color("AppSecondaryBackgroundColor")
        let contactAvatar = Color("ContactAvatar")
        let disabledText = Color("DisabledTextColor")
        let fontText = Color("FontTextColor")
    }
}
