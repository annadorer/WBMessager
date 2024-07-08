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
        let button = Color("ButtonColor")
        let buttonText = Color("ButtonTextColor")
        let appBackground = Color("AppBackgroundColor")
        let appSecondaryBackground = Color("AppSecondaryBackgroundColor")
        let contactAvatar = Color("ContactAvatar")
        let disabledText = Color("DisabledTextColor")
        let fontText = Color("FontTextColor")
        let firstGradientLightColor = Color("FirstGradientLightColor")
        let secondGradientLightColor = Color("SecondGradientLightColor")
        let firstGradientDarkColor = Color("FirstGradientDarkColor")
        let secondGradientDarkColor = Color("SecondGradientDarkColor")
        let divider = Color("DividerColor")
        let disabledButton = Color("DisabledButtonColor")
    }
}
