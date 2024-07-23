//
//  ContactsSearchBarView.swift
//  WBMessager
//
//  Created by Anna on 12.06.2024.
//

import SwiftUI

public struct SearchBarView: View {
    
    @Binding var search: String
    
    public init(search: Binding<String>) {
        self._search = search
    }
    
    public var body: some View {
        HStack {
            Image.designIcon.search
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
