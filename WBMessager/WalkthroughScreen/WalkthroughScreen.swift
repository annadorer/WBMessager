//
//  ContentView.swift
//  WBMessager
//
//  Created by Anna on 06.06.2024.
//

import SwiftUI
import UISystem

struct WalkthroughScreen: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                Image("WalkthroughScreenIllustration")
                    .padding(.top, 135)
                    .padding(.horizontal, 62)
                
                Text(UI.Strings.welcomeMessage)
                    .font(.heading2())
                    .foregroundColor(Color.designColor.fontText)
                    .multilineTextAlignment(.center)
                    .padding(.top, 42)
                    .padding(.horizontal, 48)
                
                Spacer()
                
                Text(UI.Strings.userAgreement)
                    .font(.metadata2())
                    .foregroundColor(Color.designColor.disabledText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                UserAgreementView()
                    .padding(.horizontal, 24)
                
                Button(action: {}, label: {
                    NavigationLink(UI.Strings.actionButtonText, destination: VerificationPhoneNumberScreen())
                })
                .buttonStyle(ActionButtonStyle())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen()
    }
}
