//
//  UserAgreementView.swift
//  WBMessager
//
//  Created by Anna on 17.06.2024.
//

import SwiftUI

struct UserAgreementView: View {
    
    var body: some View {
        HStack(spacing: 0) {
            
            textArrangement(text: UI.Strings.privacyPolicy)
                .onTapGesture {
                    //TODO
                }
            
            Text("и ")
                .font(.metadata2())
                .foregroundColor(Color.designColor.disabledText)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 13)
            
            textArrangement(text: UI.Strings.termsOfUse)
                .onTapGesture {
                    //TODO
                }
        }
    }
    
    private func textArrangement(text: String) -> some View {
        HStack(spacing: 0) {
            Text(text)
                .font(.metadata2())
                .foregroundColor(Color.designColor.button)
                .multilineTextAlignment(.center)
                .padding(.top, 5)
                .padding(.bottom, 13)
        }
    }
}

struct UserAgreementView_Previews: PreviewProvider {
    static var previews: some View {
        UserAgreementView()
    }
}
