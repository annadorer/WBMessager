//
//  DictionaryOperations.swift.swift
//  WBMessager
//
//  Created by Anna on 12.07.2024.
//

import Foundation

func dictionaryOperations() {
    
    //Создаем пустой словарь
    var cityPopulation: [String: Int] = [:]
    
    //Добавляем в словарь города (ключи) и их население (значения)
    cityPopulation["Белокуриха"] = 14_735
    cityPopulation["Екатеринбург"] = 1_544_376
    cityPopulation["Калининград"] = 490_449
    cityPopulation["Красноярск"] = 1_205_473
    
    //Выводим словарь
    print(cityPopulation)
    
    //Удаляем город "Белокуриха"
    cityPopulation.removeValue(forKey: "Белокуриха")
    
    //Выводим обновленный словарь
    print(cityPopulation)
    
    //Обновляем население у города "Калининград"
    cityPopulation.updateValue(550_000, forKey: "Калининград")
    
    //Выводим обновленный словарь
    print(cityPopulation)
    
    //Получаем значений для одного из ключей
    if let population = cityPopulation["Красноярск"] {
        print("Население Красноярска: \(population)")
    } else {
        print("Город не найден")
    }
}




