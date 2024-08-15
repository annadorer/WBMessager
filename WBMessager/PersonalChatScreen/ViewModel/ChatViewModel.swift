//
//  ChatViewModel.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import Combine
import ExyteChat

final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    @Published var replyToMessage: ReplyMessage?

    private let interactor: ChatInteractorProtocol
    private var subscriptions = Set<AnyCancellable>()

    init(interactor: ChatInteractorProtocol = ChatInteractor()) {
        self.interactor = interactor
    }
    func send(draft: DraftMessage, replyToMessage: ReplyMessage?) {
        interactor.send(draftMessage: draft, replyToMessage: replyToMessage)
    }
    
    func onStart() {
        interactor.messages
            .compactMap { messages in
                messages.map { $0.toChatMessage() }
            }
            .assign(to: &$messages)

        interactor.connect()
    }

    func onStop() {
        interactor.disconnect()
    }

    func loadMoreMessage(before message: Message) {
        interactor.loadNextPage()
            .sink { _ in }
            .store(in: &subscriptions)
    }
}
