//
//  MessageModel.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat

struct Message {
    let id: String
    let user: User
    let createdAt: Date
    var status: ExyteChat.Message.Status?

    let text: String
    let images: [MessageImage]
    let videos: [MessageVideo]
    let recording: Recording?
    let replyMessage: ReplyMessage?
}

struct MessageImage {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .image
        )
    }
}

struct MessageVideo {
    let id: String
    let thumbnail: URL
    let full: URL

    func toChatAttachment() -> Attachment {
        Attachment(
            id: id,
            thumbnail: thumbnail,
            full: full,
            type: .video
        )
    }
}
