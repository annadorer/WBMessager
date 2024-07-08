//
//  ContactsSearchBarView.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var search: String
    
    var body: some View {
        HStack {
            
            Image("ContactSearchIcon")
                .padding(.leading, 8)
            
            TextField("Search", text: $search)
                .frame(width: 327, height: 36)
                .foregroundColor(Color.designColor.disabledText)
                .font(.bodyText1())
        }
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.designColor.appSecondaryBackground))
    }
}


struct ContactsSearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(search: .constant(""))
    }
}
