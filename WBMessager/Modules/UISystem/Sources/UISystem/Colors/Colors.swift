//
//  Colors.swift
//  WBMessager
//
//  Created by Anna on 03.07.2024.
//

import SwiftUI

public extension Color {
    
    static let designColor = DesignColor()
    
    struct DesignColor {
        public let button = Color("ButtonColor", bundle: .module)
        public let buttonText = Color("ButtonTextColor", bundle: .module)
        public let appBackground = Color("AppBackgroundColor", bundle: .module)
        public let appSecondaryBackground = Color("AppSecondaryBackgroundColor", bundle: .module)
        public let contactAvatar = Color("ContactAvatar", bundle: .module)
        public let disabledText = Color("DisabledTextColor", bundle: .module)
        public let fontText = Color("FontTextColor", bundle: .module)
        public let firstGradientLightColor = Color("FirstGradientLightColor", bundle: .module)
        public let secondGradientLightColor = Color("SecondGradientLightColor", bundle: .module)
        public let firstGradientDarkColor = Color("FirstGradientDarkColor", bundle: .module)
        public let secondGradientDarkColor = Color("SecondGradientDarkColor", bundle: .module)
        public let divider = Color("DividerColor", bundle: .module)
        public let disabledButton = Color("DisabledButtonColor", bundle: .module)
        public let activeText = Color("ActiveTextColor", bundle: .module)
        public let codeField = Color("CodeFieldColor", bundle: .module)
        public let unreadMessage = Color("UnreadMessage", bundle: .module)
        public let unreadMessageNumber = Color("UnreadMessageNumber", bundle: .module)
        public let repliedMessageBackground = Color("RepliedMessageBackgroundColor", bundle: .module)
        public let chatBackground = Color("ChatBackgroundColor", bundle: .module)
    }
}
