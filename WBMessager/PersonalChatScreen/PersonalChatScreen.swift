//
//  PersonalChatScreen.swift
//  WBMessager
//
//  Created by Anna on 06.08.2024.
//

import SwiftUI
import ExyteChat
import ExyteMediaPicker
import UISystem

struct PersonalChatScreen: View {
    
    @EnvironmentObject var viewModel: ChatViewModel
    @State private var message: String = ""
    @State private var replyToMessage: ReplyMessage?
    let contact: MockUser
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Button(action: {}) {
                    
                    HStack {
                        
                        Image.designIcon.back
                        
                        Text(viewModel.shortName(contact.name))
                            .foregroundColor(Color.designColor.fontText)
                            .font(.subHeading1())
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image.designIcon.searchInChat
                }
                .padding(.horizontal, 8)
                
                Button(action: {}) {
                    Image.designIcon.chatOptions
                }
            }
            .padding([.top, .horizontal], 16)
            
            ChatView(messages: viewModel.messages) { draft in
                viewModel.send(draft: draft)
            }
        messageBuilder: { message, _, _ in
            
            VStack {
                if message.user.id == "1" {
                    
                    HStack {
                        
                        Spacer()
                        
                        VStack {
                            if let replyMessage = message.replyMessage {
                                RepliedMessageView(text: replyMessage.text)
                            }
                            SendMessageView(message: message)
                        }
                    }
                } else {
                   
                    HStack {
                        
                        VStack(alignment: .trailing, spacing: 10) {
                            if let replyMessage = message.replyMessage {
                                RepliedMessageView(text: replyMessage.text)
                            }
                            RecievedMessageView(message: message)
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                }
            }
        }
        inputViewBuilder: { textBinding, attachments, state, style, actionClosure in
            Group {
                switch style {
                case .message:
                    MessageInputView(messageText: message, onSend: viewModel.sendToUser, onAddMedia: {})
                case .signature:
                    EmptyView()
                }
            }
        }
        }
        .environmentObject(viewModel)
        .onAppear(perform: viewModel.onStart)
        .onDisappear(perform: viewModel.onStop)
        .background(Color.designColor.appBackground)
    }
}

struct PersonalChatScreen_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ChatViewModel(isOp: true)
        PersonalChatScreen(contact: MockUser(uid: "Nastya", name: "Анастасия Иванова", avatar: URL(string: "")))
            .environmentObject(viewModel)
    }
}
