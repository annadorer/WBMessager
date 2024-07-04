//
//  ActionButtonView.swift
//  WBMessager
//
//  Created by Anna on 07.06.2024.
//

import SwiftUI

struct ActionButtonView: View {
    
    @State private var isVerificationSheetPresented = false
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button(title) {
            self.isVerificationSheetPresented.toggle()
        }
        .frame(width: 327, height: 52)
        .font(.subHeading2())
        .multilineTextAlignment(.center)
        .foregroundColor(Color.designColor.actionButtonText)
        .background(Color.designColor.actionButton)
        .cornerRadius(30)
        .padding(.horizontal, 24)
        .sheet(isPresented: $isVerificationSheetPresented) {
            VerificationScreen()
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonView(title: UI.Strings.actionButtonText) {}
    }
}
