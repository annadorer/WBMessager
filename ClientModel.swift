//
//  ClientModel.swift
//  WBMessager
//
//  Created by Anna on 05.08.2024.
//

import Foundation

protocol TaskProcessor {
    func processTask(_ task: Data) async throws -> DataResult
}

// MARK: Реализация клиента

actor Client: TaskProcessor {
    let id: UUID
    let task: TaskProcessor
    
    init(id: UUID, task: TaskProcessor) {
        self.id = id
        self.task = task
    }
    
    //Функция, которая обрабатывает ошибку, если в задаче данных нет
    func processTask(_ task: Data) async throws -> DataResult {
        if task.data.isEmpty {
            throw Errors.emptyData("Data is empty!")
        }
        try await Task.sleep(nanoseconds: 3 * 1_000_000_000) // Повторная попытка через 3 секунды
        return DataResult(id: task.id, taskResult: "Processed \(task.data) by client \(id)")
    }
}
