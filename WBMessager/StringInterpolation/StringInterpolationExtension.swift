//
//  StringInterpolationExtension.swift
//  WBMessager
//
//  Created by Anna on 27.06.2024.
//

import Foundation

extension String.StringInterpolation {
    
    mutating func appendInterpolation(date: Date, locale: Locale) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .long
        
        self.appendLiteral(dateFormatter.string(from: date))
    }
    
    mutating func appendInterpolation(spellOut date: Date, locale: Locale) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let dateFormatter = NumberFormatter()
        
        dateFormatter.locale = locale
        dateFormatter.numberStyle = .spellOut
        
        guard let day = components.day, let month = components.month, let year = components.year else { return }
        
        let dayString = dateFormatter.string(from: NSNumber(value: day)) ?? "\(day)"
        let monthString = dateFormatter.string(from: NSNumber(value: month)) ?? "\(month)"
        let yearString = dateFormatter.string(from: NSNumber(value: year)) ?? "\(year)"
        
        self.appendLiteral("\(dayString) \(monthString) \(yearString)")
    }
}
