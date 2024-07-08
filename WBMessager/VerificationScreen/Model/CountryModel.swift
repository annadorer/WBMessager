//
//  CountryModel.swift
//  WBMessager
//
//  Created by Anna on 08.07.2024.
//

import Foundation

struct CountryModel: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let flag: String
    let phoneCode: String
}
