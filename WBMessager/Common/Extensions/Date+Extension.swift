//
//  DateExtension.swift
//  WBMessager
//
//  Created by Anna on 17.06.2024.
//

import Foundation

extension Date {
    
    func displayLastSeenDate() -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        let unitOfTime = calendar.dateComponents([.minute, .hour, .day], from: self, to: currentDate)
        
        if let days = unitOfTime.day, days > 0 {
            switch days {
            case 1: return "Last seen yesterday"
            default: return "Last seen \(days) days ago"
            }
        } else if let hours = unitOfTime.hour, hours > 0 {
            return "Last seen \(hours) \(hours == 1 ? "hour" : "hours") ago"
        } else if let minutes = unitOfTime.minute {
            return "Last seen \(minutes) \(minutes == 1 ? "minute" : "minutes") ago"
        }
        return ""
    }
    
    func randomTime() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: self)
        components.hour = Int.random(min: 0, max: 23)
        components.minute = Int.random(min: 0, max: 59)
        components.second = Int.random(min: 0, max: 59)

        return Calendar.current.date(from: components)!
    }
}
