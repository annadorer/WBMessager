//
//  DistributedSystem.swift
//  WBMessager
//
//  Created by Anna on 05.08.2024.
//

import Foundation
import Combine

// MARK: Ошибки при обработке задач

enum Errors: Error {
    case emptyData(String)
    case defunctClient
}

// MARK: Данные, которые система будет обрабатывать

struct Data: Codable {
    let id: UUID
    let data: String
}

//MARK: Результаты обработки между клиентами

struct DataResult: Codable {
    let id: UUID
    let taskResult: String
}
