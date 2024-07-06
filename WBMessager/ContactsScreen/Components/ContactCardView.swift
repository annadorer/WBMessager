//
//  ContactCardView.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI

struct ContactCardView: View {
    let contact: ContactCardModel
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            ContactAvatar(contact: contact)
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(contact.name)
                    .font(.bodyText1())
                    .foregroundColor(Color("FontTextColor"))
                
                Text(contact.isOnline ? "Online" : contact.lastSeenDate.displayLastSeenDate())
                    .font(.metadata1())
                    .foregroundColor(Color("DisabledTextColor"))
            }
        }
        .padding(.top, 16)
        .padding(.bottom, 12)
        .padding(.horizontal, 24)
    }
}

struct ContactCardView_Previews: PreviewProvider {
    static var previews: some View {
        ContactCardView(contact: ContactCardModel(name: "Анастасия Ивановна", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: true, hasStory: false, lastSeenDate: Date()))
    }
}
