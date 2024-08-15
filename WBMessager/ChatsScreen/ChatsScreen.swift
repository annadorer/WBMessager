//
//  ChatsScreen.swift
//  WBMessager
//
//  Created by Anna on 13.06.2024.
//

import SwiftUI
import ExyteChat
import UISystem

struct ChatsScreen: View {
    
    @State var searchedChat: String = ""
    
    let contacts: ContactCardModel
    let chats: [ChatCardModel] = [
        .init(message: "че каво", time: "Сегодня", unreadCount: 1),
        .init(message: "Как дела?", time: "17.05", unreadCount: 0),
        .init(message: "Пон, прин", time: "17.05", unreadCount: 1)]
    
    var filteredChats: [ChatCardModel] {
       if searchedChat.isEmpty {
           return chats
       } else {
           return chats.filter { $0.message.lowercased().contains(searchedChat.lowercased()) }
       }
   }
    
    var body: some View {
        
        NavigationStack {
            
            StoriesView(contact: ContactCardModel(name: "Маман", image: "ThirdContactImage", phoneNumber: "", isOnline: false, hasStory: true, lastSeenDate: Date()))
            
            Divider()
                .background(Color.designColor.divider)
            
            SearchBarView(search: $searchedChat)
                .padding(.top, 16)
            
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(filteredChats, id: \.self) { chat in
                        NavigationLink(destination: PersonalChatView()) {
                            ChatCardView(chat: chat, contact: contacts)
                        }
                    }
                }
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Чаты")
                            .font(.subHeading1())
                            .foregroundColor(Color.designColor.fontText)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            //TODO NewChatScreen
                        }) {
                            Image("NewChat")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            Image("ListCheck")
                        }
                        
                    }
                }
            }
            .background(Color.designColor.appBackground)
        }
    }
}

struct ChatsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChatsScreen(contacts: ContactCardModel(name: "Анастасия Иванова", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: false, lastSeenDate: Date(timeIntervalSinceNow: -90_000)))
    }
}
