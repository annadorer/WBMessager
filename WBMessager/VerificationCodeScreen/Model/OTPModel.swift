//
//  AuthDataModel.swift
//  WBMessager
//
//  Created by Anna on 10.07.2024.
//

import Foundation

struct OTPModel {
    let maxLength: Int = 4
    var phoneNumber: String
    var code: String {
        didSet {
            if code.count > maxLength {
                code = String(code.prefix(maxLength))
            }
        }
    }
}

struct OTPModelSequence: Sequence {
    private let phoneNumbers: [String]
    
    init(phoneNumbers: [String]) {
        self.phoneNumbers = phoneNumbers
    }
    
    func makeIterator() -> OTPIterator {
        return OTPIterator(phoneNumbers: phoneNumbers)
    }
}

struct OTPIterator: IteratorProtocol {
    
    private var currentIndex = 0
    private let phoneNumbers: [String]
    
    init(phoneNumbers: [String]) {
        self.phoneNumbers = phoneNumbers
    }
    
    private func generateRandomCode() -> String {
        let characters = "0123456789"
        return String((0..<4).map { _ in characters.randomElement()! })
    }
    
    mutating func next() -> OTPModel? {
        guard currentIndex < phoneNumbers.count else {
            return nil
        }
        let phoneNumber = phoneNumbers[currentIndex]
        let code = generateRandomCode()
        currentIndex += 1
        return OTPModel(phoneNumber: phoneNumber, code: code)
    }
}
