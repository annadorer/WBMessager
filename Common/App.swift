//
//  App.swift
//  WBMessager
//
//  Created by Anna on 15.07.2024.
//

import Foundation

@main struct Main {
    
    static func main() {
        let system = DistributedSystem()
    }
    
    //MARK: Реализация задачи
    
    private class DistributedSystem {
        
        //Создание клиентов
        let client1 = Client(id: UUID(), task: TaskProcessor.self as! TaskProcessor)
        let client2 = Client(id: UUID(), task: TaskProcessor.self as! TaskProcessor)
        let client3 = Client(id: UUID(), task: TaskProcessor.self as! TaskProcessor)
        
        //Создание менеджера
        let taskManager = TaskManager()
        
        func processor() async {
            
            //Добавление клиентов
            await taskManager.addClient(client1)
            await taskManager.addClient(client2)
            await taskManager.addClient(client3)
            
            //Добавление задач
            await taskManager.addTask(Data(id: UUID(), data: "Data1"))
            await taskManager.addTask(Data(id: UUID(), data: "Data2"))
            
            //Распределение задач между клиентами
            await taskManager.distributeTask()
            
            //Получение результатов и возможных ошибок
            let results = await taskManager.getResults()
            let errors = await taskManager.getErrors()
            
            print("Errors: \(errors)")
            print("Results: \(results)")
        }
    }
}

