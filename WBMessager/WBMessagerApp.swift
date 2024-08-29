//
//  WBMessagerApp.swift
//  WBMessager
//
//  Created by Anna on 06.06.2024.
//

import SwiftUI

@main
struct WBMessagerApp: App {
    @StateObject private var viewModel = ChatViewModel(isOp: true)
    
    var body: some Scene {
        WindowGroup {
            PersonalChatScreen(contact: MockUser(uid: "1", name: "Петя"))
                .environmentObject(viewModel)
        }
    }
}
