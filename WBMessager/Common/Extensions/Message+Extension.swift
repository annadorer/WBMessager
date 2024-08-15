//
//  Message+Extension.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat

extension Message {
    func toChatMessage() -> ExyteChat.Message {
        ExyteChat.Message(
            id: id,
            user: user.toChatUser(),
            status: status,
            createdAt: createdAt,
            text: text,
            attachments: images.map { $0.toChatAttachment() } + videos.map { $0.toChatAttachment() },
            recording: recording,
            replyMessage: replyMessage
        )
    }
}
