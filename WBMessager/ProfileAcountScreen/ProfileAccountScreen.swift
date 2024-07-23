//
//  ProfileAccountScreen.swift
//  WBMessager
//
//  Created by Anna on 14.06.2024.
//

import SwiftUI
import UISystem

struct ProfileAccountScreen: View {
    
    @Environment(\.presentationMode) var backButton
    
    var contact: ContactCardModel
    
    var body: some View {
        
        NavigationStack {
            
            VStack(spacing: 0) {
                
                Image(contact.image ?? "DefaultContactImage")
                    .frame(width: 200, height: 200)
                    .cornerRadius(100)
                    .padding(.top, 46)
                
                Text(contact.name)
                    .font(.heading2())
                    .foregroundColor(Color.designColor.fontText)
                    .padding(.top, 20)
                
                Text(contact.phoneNumber)
                    .font(.subHeading2())
                    .foregroundColor(Color.designColor.disabledText)
                    .padding(.top, 4)
                    .padding(.horizontal, 116)
                
                SocialMediaButtons(icons: [Image.designIcon.facebook, Image.designIcon.instagram, Image.designIcon.linkedIn, Image.designIcon.x])
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.backButton.wrappedValue.dismiss()
                    }) {
                        Image("BackIcon")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Профиль")
                        .font(.subHeading1())
                        .foregroundColor(Color.designColor.fontText)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        //TODO EditProfileScreen
                    }) {
                        Image("EditProfileIcon")
                    }
                }
            }
            
        }
        .background(Color.designColor.appBackground)
    }
}

struct ProfileAccountScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileAccountScreen(contact: ContactCardModel(name: "Анастасия Иванова", image: "FirstContactImage", phoneNumber: "+7 999 999-99-99", isOnline: false, hasStory: false, lastSeenDate: Date()))
    }
}
