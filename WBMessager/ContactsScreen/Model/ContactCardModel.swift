//
//  ContactCardModel.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//


import SwiftUI

struct ContactCardModel: Identifiable, Hashable {
    
    let id = UUID()
    let name: String
    let image: String?
    let phoneNumber: String
    let isOnline: Bool
    let hasStory: Bool
    let lastSeenDate: Date
    
    var initials: String {
        let initialsComponents = name.split(separator: " ")
        let firstInitial = initialsComponents.first?.first.map { String($0) } ?? ""
        let lastInitial = initialsComponents.dropFirst().first?.first.map { String($0) } ?? ""
        return (firstInitial + lastInitial).uppercased()
    }
}
