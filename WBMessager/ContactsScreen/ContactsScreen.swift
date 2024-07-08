//
//  ContactsListScreen.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
    
    @State var searchedContact: String = ""
    
    let contacts: [ContactCardModel] = [
        .init(name: "Анастасия Иванова", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: false, lastSeenDate: Date(timeIntervalSinceNow: -90_000)),
        .init(name: "Петя", image: "SecondContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Маман", image: "ThirdContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: true, lastSeenDate: Date(timeIntervalSinceNow: -10_800)),
        .init(name: "Арбуз Дыня", image: "FourthContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Иван Иванов", image: nil, phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()),
        .init(name: "Лиса Алиса", image: nil, phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: true, lastSeenDate: Date(timeIntervalSinceNow: -1_800))]
    
     var filteredContacts: [ContactCardModel] {
        if searchedContact.isEmpty {
            return contacts
        } else {
            return contacts.filter { $0.name.lowercased().contains(searchedContact.lowercased()) }
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            SearchBarView(search: $searchedContact)
                .padding(.top, 16)
                .padding(.horizontal, 24)
            
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading) {
                    ForEach(filteredContacts, id: \.self) { contact in
                        NavigationLink(destination: ProfileAccountScreen(contact: contact)) {
                            ContactCardView(contact: contact)
                        }
                        
                        Divider()
                            .background(Color.designColor.divider)
                            .padding(.horizontal, 24)
                    }
                }
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Контакты")
                            .font(.subHeading1())
                            .foregroundColor(Color.designColor.fontText)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            //TODO NewContactScreen
                        }) {
                            Image("NewContactIcon")
                        }
                    }
                }
                
            }
            .background(Color.designColor.appBackground)
        }
    }
}

struct ContactsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContactsScreen()
    }
}
