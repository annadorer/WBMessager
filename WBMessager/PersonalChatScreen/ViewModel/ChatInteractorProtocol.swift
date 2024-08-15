//
//  ChatInteractorProtocol.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat
import Combine

protocol ChatInteractorProtocol {
    var messages: AnyPublisher<[Message], Never> { get }
    var user: [User] { get }
    var otherUser: [User] { get }

    func send(draftMessage: ExyteChat.DraftMessage, replyToMessage: ExyteChat.ReplyMessage?)

    func connect()
    func disconnect()

    func loadNextPage() -> Future<Bool, Never>
}
