//
//  CodeInputView.swift
//  WBMessager
//
//  Created by Anna on 10.07.2024.
//

import SwiftUI

struct CodeInputView: View {
    
    @State var digit: [String]
    @State var OTPData: OTPModel
    @FocusState private var hasFocus: Int?
    
    init(authData: OTPModel, hasFocus: Int? = nil) {
        self.digit = Array(repeating: "", count: authData.maxLength)
        self.OTPData = authData
        self.hasFocus = hasFocus
    }
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(0..<OTPData.maxLength, id: \.self) { index in
                codeDigit(index: index)
                    .focused($hasFocus, equals: index)
                    .tag(index)
                    .onChange(of: digit[index]) { newValue in
                        digit[index] = String(newValue.suffix(1))
                        if !newValue.isEmpty {
                            if index == OTPData.maxLength - 1 {
                                hasFocus = nil
                            } else {
                                hasFocus = (hasFocus ?? 0) + 1
                            }
                        } else {
                            hasFocus = (hasFocus ?? 0) - 1
                        }
                    }
            }
        }
        .padding(.top, 49)
    }
    
    private func codeDigit(index: Int) -> some View  {
        TextField("", text: $digit[index])
            .font(.heading1())
            .foregroundColor(Color.designColor.fontText)
            .frame(width: 32, height: 40)
            .background(Circle().fill(digit[index].isEmpty ? Color.designColor.codeField : Color.clear))
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
}

struct CodeInputView_Previews: PreviewProvider {
    static var previews: some View {
        CodeInputView(authData: OTPModel(phoneNumber: "+7 999 999 00-00", code: ""))
    }
}
