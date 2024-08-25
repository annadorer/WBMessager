//
//  SendMessageView.swift
//  WBMessager
//
//  Created by Anna on 24.08.2024.
//

import SwiftUI
import ExyteChat
import UISystem

struct SendMessageView: View {
    var message: Message
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 10) {
            Text(message.text)
            Text(message.createdAt, style: .time)
                .font(.bodyText2())
                .foregroundColor(Color.designColor.disabledText)
            if !message.attachments.isEmpty {
                ForEach(message.attachments, id: \.id) { at in
                    AsyncImage(url: at.thumbnail)
                }
            }
        }
    }
}

struct SendMessageView_Previews: PreviewProvider {
    static var previews: some View {
        SendMessageView(message: Message(id: "1", user: User(id: "1", name: "you", avatarURL: nil, isCurrentUser: true), status: .read, createdAt: Date(), text: "Годзила топчик", attachments: [], recording: nil, replyMessage: nil))
    }
}
