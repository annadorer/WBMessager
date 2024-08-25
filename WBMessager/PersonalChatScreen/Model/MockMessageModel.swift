//
//  MockMessageModel.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat

struct MockMessage {
    let uid: String
    let sender: MockUser
    let createdAt: Date
    var status: Message.Status?

    let text: String
    let images: [MockImage]
    let videos: [MockVideo]
    let recording: Recording?
    let replyMessage: ReplyMessage?
}
