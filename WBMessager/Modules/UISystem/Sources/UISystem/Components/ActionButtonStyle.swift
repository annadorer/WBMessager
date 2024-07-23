//
//  ActionButtonStyle.swift
//  WBMessager
//
//  Created by Anna on 07.06.2024.
//

import SwiftUI

public struct ActionButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    public init() {}
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 327, height: 52)
            .font(.subHeading2())
            .multilineTextAlignment(.center)
            .foregroundColor(Color.designColor.buttonText)
            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(Color.designColor.button).opacity(isEnabled ? 1.0 : 0.5))
            .cornerRadius(30)
            .padding(.horizontal, 24)
    }
}
