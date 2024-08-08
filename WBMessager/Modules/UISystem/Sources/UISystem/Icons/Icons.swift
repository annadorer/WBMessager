//
//  File.swift
//  
//
//  Created by Anna on 23.07.2024.
//

import SwiftUI

public extension Image {
    
    static let designIcon = DesignIcons()
    
    struct DesignIcons {
        public let search = Image("ContactSearch", bundle: .module)
        public let facebook = Image("ProfileAccountFacebook", bundle: .module)
        public let x = Image("ProfileAccountX", bundle: .module)
        public let linkedIn = Image("ProfileAccountLinkedIn", bundle: .module)
        public let instagram = Image("ProfileAccountInstagram", bundle: .module)
        public let newStory = Image("NewStory", bundle: .module)
    }
}
