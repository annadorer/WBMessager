//
//  ChatActions.swift
//  WBMessager
//
//  Created by Anna on 15.08.2024.
//

import Foundation
import ExyteChat
import SwiftUI

enum ChatActions: MessageMenuAction {
    case reply, delete

    func title() -> String {
        switch self {
        case .reply: return "Reply"
        case .delete: return "Delete"
        }
    }
    
    func icon() -> Image {
        switch self {
        case .reply:
            Image(systemName: "arrowshape.turn.up.left")
        case .delete:
            Image(systemName: "xmark.bin.fill")
        }
    }
}
