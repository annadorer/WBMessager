//
//  RecievedMessageView.swift
//  WBMessager
//
//  Created by Anna on 24.08.2024.
//

import SwiftUI
import ExyteChat
import UISystem

struct RecievedMessageView: View {
    
    var message: Message
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(message.text)
            Text(message.createdAt, style: .time)
                .font(.bodyText2())
                .foregroundColor(Color.designColor.disabledText)
        }
    }
}

struct RecievedMessageView_Previews: PreviewProvider {
    static var previews: some View {
        RecievedMessageView(message: Message(id: "1", user: User(id: "1", name: "you", avatarURL: nil, isCurrentUser: true), status: .read, createdAt: Date(), text: "Годзила топчик", attachments: [], recording: nil, replyMessage: nil))
    }
}
