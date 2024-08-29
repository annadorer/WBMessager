//
//  SetOperations.swift
//  WBMessager
//
//  Created by Anna on 15.07.2024.
//

import Foundation

func setOperations() {
    
    //Создаем пустое множество
    var numbers: Set<Int> = []
    
    //Добавляем в множество элементы
    numbers.insert(1)
    numbers.insert(3)
    numbers.insert(5)
    numbers.insert(7)
    numbers.insert(9)
    
    //Выводим исходное множество
    print("Множество: \(numbers)")
    
    //Удаляем элемент 7 из множества
    numbers.remove(7)
    
    //Выводим обновленное множество
    print(numbers)
    
    //Проверяем, существует ли элемент 5 в множестве
    if numbers.contains(5){
        print("Элемент 5 существует в множестве")
    } else {
        print("Элемента 5 нет в множестве")
    }
    
    //Создаем второе множество
    let randomNumbers: Set<Int> = [1, 4, 12, 9, 3, 22, 45]
    
    //Объединение (значения обоих множеств), т.е. [1, 3, 4, 5, 7, 9, 12, 22, 45]
    let union = numbers.union(randomNumbers)
    print(union)
    
    //Пересечение (общие значения двух множеств), т.е. [1, 3, 9]
    let intersection = numbers.intersection(randomNumbers)
    print(intersection)
    
    //Разность (значения, не принадлежащие указанному множеству из двух входных множеств), т.е. [5, 7]
    let subtracting =  numbers.subtracting(randomNumbers)
    print(subtracting)
}
