//
//  StringInterpolationView.swift
//  WBMessager
//
//  Created by Anna on 28.06.2024.
//

import SwiftUI
import Foundation

enum DateTypes {
    case dayBeforeYesterday, yesterday, today, tommorow, dayAfterTommorow
}

struct StringInterpolationView: View {
    
    @State private var selectedDate = Date()
    @State private var selectedLocale = Locale.current
    @State private var isSpellOut = true
    
    var dateTypes: DateTypes = .today
    var flags: [String] = ["🇺🇸", "🇷🇺", "🇰🇷", "🇫🇮", "🇷🇸"]
    var locales: [Locale] = [
        Locale(identifier: "en_US"),
        Locale(identifier: "ru_RU"),
        Locale(identifier: "ko_KR"),
        Locale(identifier: "fi_FI"),
        Locale(identifier: "sr")]
    
    var body: some View {
        
        VStack() {
            
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal, 20)
            
            Toggle("Type of date", isOn: $isSpellOut)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            Picker("Choose the language", selection: $selectedLocale) {
                ForEach(0..<locales.count, id: \.self) { index in
                    Text(self.flags[index]).tag(self.locales[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            displayDate(from: selectedDate)
        }
        .padding(.top, 20)
    }
    
    private func displayDate(from date: Date) -> some View {
        let calendar = Calendar.current
        let daysOffset = [-2, -1, 0, 1, 2]
        let dateTypes = [DateTypes].init([.dayBeforeYesterday, .yesterday, .today, .tommorow, .dayAfterTommorow])
        var displayedDates: [String] = []
        if !isSpellOut {
           displayedDates = daysOffset.enumerated().map { index, offset in
                let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
                return "\(dateTypes[index]): \(spellOut: newDate, locale: selectedLocale)"
            }
        } else {
            displayedDates = daysOffset.enumerated().map { index, offset in
                let newDate = calendar.date(byAdding: .day, value: offset, to: date)!
                return "\(dateTypes[index]): \(date: newDate, locale: selectedLocale)"
            }
        }
        return List {
            ForEach(displayedDates, id: \.self) { dateText in
                Text(dateText)
                    .font(dateText.contains("\(DateTypes.today)") ? .subheadline.bold() : .subheadline)
            }
        }
        .listStyle(.plain)
    }
}

struct StringInterpolationView_Previews: PreviewProvider {
    static var previews: some View {
        StringInterpolationView()
    }
}
