//
//  User+Extension.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat

extension User {
    var isCurrentUser: Bool {
        uid == "1"
    }
    
    func toChatUser() -> ExyteChat.User {
        ExyteChat.User(id: uid, name: name, avatarURL: URL(string: image ?? ""), isCurrentUser: isOnline)
    }
}
