//
//  WBMessagerWidget.swift
//  WBMessagerWidget
//
//  Created by Anna on 25.06.2024.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    
    let contact: [ContactCardModel] = [
        .init(name: "Анастасия Иванова", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: false, lastSeenDate: Date(timeIntervalSinceNow: -90_000)),
        .init(name: "Петя", image: "SecondContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Маман", image: "ThirdContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: true, lastSeenDate: Date(timeIntervalSinceNow: -10_800)),
        .init(name: "Арбуз Дыня", image: "FourthContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Иван Иванов", image: nil, phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Лиса Алиса", image: nil, phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: true, lastSeenDate: Date(timeIntervalSinceNow: -1_800))]
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let entry = SimpleEntry(date: Date(), contact: contact)
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {
        var entries: [SimpleEntry] = []
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contact: contact)
            entries.append(entry)
        }
        
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contact: contact)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contact: [ContactCardModel]
}

struct WBMessagerWidgetEntryView : View {
    var entry: Provider.Entry
    
    
    var body: some View {
        let firstContact: ContactCardModel? = entry.contact.sorted { contact1, contact2 in
            return contact1.lastSeenDate < contact2.lastSeenDate
        }.first { contact in
            contact.isOnline
        }
        
        VStack {
            ContactAvatar(contact: firstContact!)
            Text(firstContact!.name)
                .font(.bodyText2())
                .foregroundColor(Color("FontTextColor"))
        }
        .multilineTextAlignment(.center)
    }
}

struct WBMessagerWidget: Widget {
    let kind: String = "WBMessagerWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WBMessagerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("WBMessagerWidget")
        .description("This widget shows which contact is online. When you click on widget, contacts screen opens.")
        .supportedFamilies([.systemSmall])
    }
}
