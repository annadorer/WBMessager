//
//  ChatCardView.swift
//  WBMessager
//
//  Created by Anna on 06.08.2024.
//

import SwiftUI
import UISystem

struct ChatCardView: View {
    
    let chat: ChatCardModel
    let contact: ContactCardModel
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            ContactAvatar(contact: contact)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(contact.name)
                    .font(.bodyText1())
                    .foregroundColor(Color.designColor.fontText)
                
                Text(chat.message)
                    .font(.metadata1())
                    .foregroundColor(Color.designColor.disabledText)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 6) {
                Text(chat.time)
                    .font(.metadata1())
                    .foregroundColor(Color.designColor.disabledText)
                if chat.unreadCount > 0 {
                    Text("\(chat.unreadCount)")
                        .font(.metadata3())
                        .foregroundColor(Color.designColor.unreadMessageNumber)
                        .padding(6)
                        .background(Circle().foregroundColor(Color.designColor.unreadMessage)).frame(width: 21, height: 20)
                        
                }
            }
                
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .padding(.horizontal, 24)
    }
}

struct ChatCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChatCardView(chat: ChatCardModel(message: "че каво", time: "Сегодня", unreadCount: 1),
                     contact: ContactCardModel(name: "Анастасия Ивановна", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()))
    }
}
