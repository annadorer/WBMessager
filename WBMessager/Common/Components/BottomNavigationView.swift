//
//  TabView.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI

enum Tabs {
    case contacts
    case chats
    case more
    
    var activeIcon: String {
        switch self {
        case .contacts: return "TabBarContactActiveIcon"
        case .chats: return "TabBarChatActiveIcon"
        case .more: return "TabBarOtherActiveIcon"
        }
    }
    
    var inactiveIcon: String {
        switch self {
        case .contacts: return "TabBarContactInactiveIcon"
        case .chats: return "TabBarChatInactiveIcon"
        case .more: return "TabBarOtherInactiveIcon"
        }
        
    }
}

struct BottomNavigationView: View {
    
    @State private var selectedTab: Tabs = .contacts
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            ContactsScreen().tabItem {
                Image(selectedTab == .contacts ? Tabs.contacts.activeIcon : Tabs.contacts.inactiveIcon)
            }.tag(Tabs.contacts)
            
            ChatsScreen(contacts: ContactCardModel(name: "Анастасия Иванова", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: false, lastSeenDate: Date(timeIntervalSinceNow: -90_000))).tabItem {
                Image(selectedTab == .chats ? Tabs.chats.activeIcon : Tabs.chats.inactiveIcon)
            }.tag(Tabs.chats)
            
            MoreScreen().tabItem {
                Image(selectedTab == .more ? Tabs.more.activeIcon : Tabs.more.inactiveIcon)
            }.tag(Tabs.more)
        }
        .shadow(color: Color.black.opacity(0.04), radius: 24)
    }
}
    

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationView()
    }
}
