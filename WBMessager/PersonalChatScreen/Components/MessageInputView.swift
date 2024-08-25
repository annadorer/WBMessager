//
//  MessageInputView.swift
//  WBMessager
//
//  Created by Anna on 24.08.2024.
//

import SwiftUI
import UISystem

struct MessageInputView: View {
    
    @State var messageText: String
    var onSend: () -> Void
    var onAddMedia: () -> Void

    var body: some View {
        HStack {
            Button(action: onAddMedia) {
                Image.designIcon.addMedia
                    .padding(.horizontal, 12)
            }

            TextField("Введите сообщение...", text: $messageText)
                .frame(width: 279, height: 36)
                .foregroundColor(Color.designColor.fontText).font(.bodyText1())
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.designColor.appSecondaryBackground))

            Button(action: onSend) {
                Image.designIcon.sendMessage
                    .padding(.horizontal, 12)
            }
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: "Good mor", onSend: {}, onAddMedia: {})
    }
}
