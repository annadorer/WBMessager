//
//  CodeInformationView.swift
//  WBMessager
//
//  Created by Anna on 10.07.2024.
//

import SwiftUI

struct CodeInformationView: View {
    
    @Binding var inputNumber: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Text(UI.Strings.enteringCode)
                .font(.heading2())
                .foregroundColor(Color.designColor.fontText)
                .multilineTextAlignment(.center)
                .padding(.top, 79)
                .padding(.horizontal, 40)
            
            Text(UI.Strings.sentCodeAlready)
                .font(.bodyText2())
                .foregroundColor(Color.designColor.fontText)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.top, 8)
                .padding(.horizontal, 40)
            
            Text(inputNumber)
                .font(.bodyText2())
                .foregroundColor(Color.designColor.fontText)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .padding(.top, 8)
                .padding(.horizontal, 40)
        }
    }
}

struct CodeInformationView_Previews: PreviewProvider {
    static var previews: some View {
        CodeInformationView(inputNumber: .constant("+7 999 999-99-99"))
    }
}
