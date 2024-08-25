//
//  RepliedMessageView.swift
//  WBMessager
//
//  Created by Anna on 24.08.2024.
//

import SwiftUI
import UISystem

struct RepliedMessageView: View {
    var text: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            
            Text("Вы")
                .font(.metadata3())
                .foregroundColor(Color.designColor.activeText)
            
            Text(text)
                .font(.bodyText2())
                .foregroundColor(Color.designColor.fontText)
        }
        .background(RoundedRectangle(cornerRadius: 4)
            .fill(Color.designColor.repliedMessageBackground)
            .background(RoundedRectangle(cornerRadius: 4)
                .fill(Color.designColor.activeText)
                .offset(x: -4))
                .frame(width: 232, height: 60)
        )
    }
}

struct RepliedMessageView_Previews: PreviewProvider {
    static var previews: some View {
        RepliedMessageView(text: "Годзила топчик")
    }
}
