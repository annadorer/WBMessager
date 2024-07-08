//
//  VerificationScreen.swift
//  WBMessager
//
//  Created by Anna on 07.06.2024.
//

import SwiftUI

struct VerificationPhoneNumberScreen: View {
    
    @Environment(\.presentationMode) var backButton
    @State var isButtonDisabled = true
    @State var isAnimated = false
    
    var body: some View {
        VStack(spacing: 0) {
            if isAnimated {
                EndlessLoadAnimation()
            } else {
                
                Text(UI.Strings.inputPhoneNumber)
                    .font(.heading2())
                    .foregroundColor(Color.designColor.fontText)
                    .multilineTextAlignment(.center)
                    .padding(.top, 79)
                    .padding(.horizontal, 40)
                
                Text(UI.Strings.sendingCode)
                    .font(.bodyText2())
                    .foregroundColor(Color.designColor.fontText)
                    .multilineTextAlignment(.center)
                    .lineSpacing(8)
                    .padding(.top, 8)
                    .padding(.horizontal, 40)
                
                PhoneNumberInputView(selectedCountry: CountryModel(name: "Russia", flag: "RU", phoneCode: "+7"), isButtonDisabled: $isButtonDisabled)
                
                Spacer()
                
                Button("Продолжить") {
                    isAnimated = true
                }
                .padding(.bottom, 60)
                .disabled(isButtonDisabled)
                .buttonStyle(ActionButtonStyle())
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.backButton.wrappedValue.dismiss()
                }) {
                    Image("BackIcon")
                }
            }
        }
    }
}

struct VerificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerificationPhoneNumberScreen()
    }
}
