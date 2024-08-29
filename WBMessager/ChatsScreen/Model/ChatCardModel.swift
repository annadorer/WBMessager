//
//  ChatCardModel.swift
//  WBMessager
//
//  Created by Anna on 06.08.2024.
//

import Foundation

struct ChatCardModel: Identifiable, Hashable {
    let id = UUID()
    let message: String
    let time: String
    let unreadCount: Int
    
    var initials: String {
        let initialsComponents = message.split(separator: " ")
        let firstInitial = initialsComponents.first?.first.map { String($0) } ?? ""
        let lastInitial = initialsComponents.dropFirst().first?.first.map { String($0) } ?? ""
        return (firstInitial + lastInitial).uppercased()
    }
}
