//
//  SocialMediaButtons.swift
//  WBMessager
//
//  Created by Anna on 14.06.2024.
//

import SwiftUI

public struct SocialMediaButtons: View {
    
    public var icons: [Image] = [Image.designIcon.facebook, Image.designIcon.instagram, Image.designIcon.linkedIn, Image.designIcon.x]
    
    public init(icons: [Image]) {
        self.icons = icons
    }
    
    public var body: some View {
        HStack(spacing: 12) {
            ForEach(0..<icons.count, id: \.self) { index in
                Button(action: {}) {
                   icons[index]
                }
            }
            .frame(width: 71, height: 40)
            .overlay(RoundedRectangle(cornerRadius: 25)
                .stroke(Color.designColor.button, lineWidth: 1.67))
        }
        .padding(.top, 40)
        .padding(.horizontal, 26)
    }
}
