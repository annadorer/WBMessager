//
//  UserModel.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation

struct User {
    let uid: String
    let name: String
    let lastSeenDate: Date
    let image: String?
    let hasStory: Bool
    let isOnline: Bool
}
