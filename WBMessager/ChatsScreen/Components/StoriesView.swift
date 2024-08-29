//
//  StoriesView.swift
//  WBMessager
//
//  Created by Anna on 06.08.2024.
//

import SwiftUI
import UISystem

struct StoriesView: View {
    
    @State var contact: ContactCardModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                VStack(spacing: 8) {
                    Image.designIcon.newStory
                        .frame(width: 48, height: 48)
                    Text(UI.Strings.yourStory)
                        .font(.metadata2())
                        .foregroundColor(Color.designColor.fontText)
                }
                if contact.hasStory {
                    VStack(spacing: 8) {
                        ContactAvatar(contact: contact)
                        Text(contact.name)
                            .font(.metadata2())
                            .foregroundColor(Color.designColor.fontText)
                    }
                }
            }
            .padding(.top, 16)
            .padding(.horizontal, 24)
            .padding(.bottom, 16)
        }
    }
}

struct StoriesView_Previews: PreviewProvider {
    static var previews: some View {
        StoriesView(contact: ContactCardModel(name: "Маман", image: "ThirdContactImage", phoneNumber: "", isOnline: false, hasStory: true, lastSeenDate: Date()))
    }
}
