//
//  ProfileAccountButtonsView.swift
//  WBMessager
//
//  Created by Anna on 14.06.2024.
//

import SwiftUI

struct ProfileAccountButtonsView: View {
    
    let icons: [String] = ["ProfileAccountXIcon", "ProfileAccountInstagramIcon", "ProfileAccountLinkedInIcon", "ProfileAccountFacebookIcon"]
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            ForEach(icons, id: \.self) { icon in
                Button(action: {
                    //TODO
                }) {
                    Image(icon)
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

struct ProfileAccountButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountButtonsView()
    }
}
