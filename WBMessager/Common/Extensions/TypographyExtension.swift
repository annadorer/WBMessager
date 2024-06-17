//
//  TextExtension.swift
//  WBMessager
//
//  Created by Anna on 07.06.2024.
//

import SwiftUI

extension Font {
    
    static func heading1(size: CGFloat = 32 ) -> Font {
        .system(size: size, weight: .bold)
    }
    
    static func heading2(size: CGFloat = 24) -> Font {
        .system(size: size, weight: .bold)
    }
    
    static func subHeading1(size: CGFloat = 18) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func subHeading2(size: CGFloat = 16) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func bodyText1(size: CGFloat = 14) -> Font {
        .system(size: size, weight: .semibold)
    }
    
    static func bodyText2(size: CGFloat = 14) -> Font {
        .system(size: size, weight: .regular)
    }
    
    static func metadata1(size: CGFloat = 12) -> Font {
        .system(size: size, weight: .regular)
    }
    
    static func metadata2(size: CGFloat = 10) -> Font {
        .system(size: size, weight: .regular)
    }
    
    static func metadata3(size: CGFloat = 10) -> Font {
        .system(size: size, weight: .semibold)
    }
}
