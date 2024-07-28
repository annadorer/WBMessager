//
//  ContactAvatarView.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI
import UISystem

struct ContactAvatar: View {
    
    @StateObject private var loader = AsyncImageLoader()
    
    let contact: ContactCardModel
    
    var body: some View {
        Group {
            if loader.image != nil {
                ZStack(alignment: .topTrailing) {
                    if contact.image != nil {
                        if contact.hasStory {
                            contactImage(image: contact.image!)
                                .background(storyBorder(gradientColors: [Color.designColor.firstGradientLightColor, Color.designColor.firstGradientDarkColor]))
                        } else {
                            contactImage(image: contact.image!) }
                    } else {
                        if contact.hasStory {
                            emptyContactImage(initials: contact.initials)
                                .background(storyBorder(gradientColors: [Color.designColor.secondGradientLightColor, Color.designColor.secondGradientDarkColor]))
                        } else {
                            emptyContactImage(initials: contact.initials)
                        }
                    }
                    if contact.isOnline {
                        Image("ContactStatusImage")
                            .offset(x: 4, y: -4)
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            loader.loadImage(assetImageName: contact.image ?? "")
        }
    }
    
    private func contactImage(image: String) -> some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 48, height: 48)
            .cornerRadius(16)
    }
    
    private func emptyContactImage(initials: String) -> some View {
        Text(initials)
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(Color.designColor.contactAvatar)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .fontWeight(.bold)
    }
    
    private func storyBorder(gradientColors: [Color]) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .strokeBorder(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
            .frame(width: 54, height: 54)
    }
}

struct ContactAvatar_Previews: PreviewProvider {
    static var previews: some View {
        ContactAvatar(contact: ContactCardModel(name: "Иван Иванов", image: nil, phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: true, lastSeenDate: Date()))
    }
}
