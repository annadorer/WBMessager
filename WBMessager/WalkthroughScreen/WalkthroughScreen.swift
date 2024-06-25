//
//  ContentView.swift
//  WBMessager
//
//  Created by Anna on 06.06.2024.
//

import SwiftUI

struct WalkthroughScreen: View {
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            Image("WalkthroughScreenIllustration")
                .padding(.top, 135)
                .padding(.horizontal, 62)
            
            Text("Общайтесь с друзьями \n и близкими легко")
                .font(.heading2())
                .foregroundColor(Color("FontTextColor"))
                .multilineTextAlignment(.center)
                .padding(.top, 42)
                .padding(.horizontal, 48)
            
            Spacer()
            
            Text("Нажимая кнопку продолжить я соглашаюсь с")
                .font(.metadata2())
                .foregroundColor(Color("DisabledTextColor"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            UserAgreementView()
                .padding(.horizontal, 24)
            
        
            ActionButtonView(title: "Начать общаться") {}
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughScreen()
    }
}
