//
//  TaskManager.swift
//  WBMessager
//
//  Created by Anna on 05.08.2024.
//

import Foundation
import Combine

// MARK: Реализация управления задачами и их распределение

actor TaskManager {
    
    private var tasks: [Data] = []
    private var results: [DataResult] = []
    private var clients: [Client] = []
    private var errors: [Errors] = []
    
    //Функция, которая добавляет нового клиента
    func addClient(_ client: Client) {
        clients.append(client)
    }
    
    //Функция, которая добавляет новую задачу в очередь задач
    func addTask(_ task: Data) {
        tasks.append(task)
    }
    
    //Функция, которая добавляет результаты обработки задач в список
    func addResults(_ result: DataResult) {
        results.append(result)
    }
    
    //Функция, которая добавляет ошибки в список
    func addErrors(_ error: Errors) {
        errors.append(error)
    }
    
    //Функция, которая распределяет задачи между клиентами
    func distributeTask() async {
        await withTaskGroup(of: Void.self) { group in
            var index = 0
            for task in tasks {
                if clients.count > index {
                    index = 0
                    self.addErrors(.defunctClient)
                }
                let client = clients.randomElement()
                group.addTask {
                    do {
                        let result = try await client?.processTask(task)
                        await self.addResults(result!)
                    } catch {
                        await self.addErrors(error as! Errors)
                    }
                }
            }
        }
    }
    
    //Функция, которая возвращает список результатов
    func getResults() -> [DataResult] {
        return results
    }
    
    //Функция, которая взвращает список ошибок
    func getErrors() -> [Errors] {
        return errors
    }
}
