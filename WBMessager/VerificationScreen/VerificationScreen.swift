//
//  VerificationScreen.swift
//  WBMessager
//
//  Created by Anna on 07.06.2024.
//

import SwiftUI

struct VerificationScreen: View {
    
    @Environment(\.presentationMode) var closeButton
    
    var body: some View {
        VStack {
            Button("Закрыть") {
                self.closeButton.wrappedValue.dismiss()
            }
        }
    }
}

struct VerificationScreen_Previews: PreviewProvider {
    static var previews: some View {
        VerificationScreen()
    }
}
