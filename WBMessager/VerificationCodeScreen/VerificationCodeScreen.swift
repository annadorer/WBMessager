//
//  VerificationCodeScreen.swift
//  WBMessager
//
//  Created by Anna on 09.07.2024.
//

import SwiftUI

struct VerificationCodeScreen: View {
    
    @Environment(\.presentationMode) var backButton
    
    let OTPData: OTPModel
    //var requestCodeAgain: OTPIterator
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 0) {
                
                CodeInformationView(inputNumber: .constant("+7 999 999-99-99"))
                
                CodeInputView(authData: OTPModel(phoneNumber: OTPData.phoneNumber, code: OTPData.code))
                
                Spacer()
                
                Text(UI.Strings.requestCodeAgain)
                    .font(.subHeading2())
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.designColor.activeText)
                    .padding(.horizontal, 68)
                    .padding(.bottom, 60)
                    .onTapGesture {
                        //self.requestCodeAgain.next()
                    }
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
        .background(Color.designColor.appBackground)
    }
}

struct VerificationCodeScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCodeScreen(OTPData: OTPModel(phoneNumber: "+7 999 999-99-99", code: ""))
    }
}
