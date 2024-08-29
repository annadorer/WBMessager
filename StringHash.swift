//
//  StringHash.swift
//  WBMessager
//
//  Created by Anna on 15.07.2024.
//

import Foundation

//Фцнкция, которая возвращает хеш-код как целое число с использованием встроенной функции hash()
func hashString(for string: String) -> Int {
    return string.hash
}

func customHash(for string: String) -> Int {
    
    //Переменная, которая будет хранить хеш-код
    var hash = 0
    
    //Цикл, который проходит по каждому символу в строке
    for char in string {
        //Здесь hash сдвигается на 5 бит влево, затем из сдвинутого значения вычитается исходное значение и прибавляется ASCII код символа в виде целого числа
        hash = (hash << 5) - hash + Int(char.asciiValue!)
        
        //Здесь применяется побитовая операция AND для ограничения результата 32 битами
        hash &= 0x0FFFFFFF
    }
    
    return hash
}

func simpleAndCustomHashExample() {
    
    let exampleString = "Техношкола WB, курс iOS-джун"
    
    let simpleHashValue = hashString(for: exampleString)
    let customHashValue = customHash(for: exampleString)
    
    print("Простой хэш-код для \(exampleString) будет \(simpleHashValue)")
    print("Кастомный хэш-код для \(exampleString) будет \(customHashValue)")
}
