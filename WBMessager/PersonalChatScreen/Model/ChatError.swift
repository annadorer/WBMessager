//
//  ChatError.swift
//  WBMessager
//
//  Created by Anna on 24.08.2024.
//

import Foundation

enum ChatError: Error {
    case unknown(source: Error?)
}
