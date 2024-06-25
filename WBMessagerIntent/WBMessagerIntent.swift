//
//  WBMessagerIntent.swift
//  WBMessagerIntent
//
//  Created by Anna on 25.06.2024.
//

import AppIntents

struct WBMessagerIntent: AppIntent {
    static var title: LocalizedStringResource = "Open chats in WBMessager"
    
    @Parameter(title: "Chats Screen", description: "Open Chats Screen when the app is running")
    var openChatsScreen: Bool
    
    func perform() async throws -> some IntentResult {
        BottomNavigationView.shared.moveToTab(tab: .chats)
        return .result()
    }
}
