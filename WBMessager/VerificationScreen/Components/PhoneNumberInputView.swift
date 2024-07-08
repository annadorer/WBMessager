//
//  PhoneNumberInputView.swift
//  WBMessager
//
//  Created by Anna on 08.07.2024.
//

import SwiftUI

struct PhoneNumberInputView: View {
    
    @State var selectedCountry: CountryModel
    @State var phoneNumber: String = ""
    @Binding var isButtonDisabled: Bool
    
    let countries: [CountryModel] = [
        .init(name: "Armenia", flag: "AR", phoneCode: "+374"),
        .init(name: "Azerbaijan", flag: "AZ", phoneCode: "+994"),
        .init(name: "Belarus", flag: "BR", phoneCode: "+375"),
        .init(name: "China", flag: "CN", phoneCode: "+86"),
        .init(name: "United Kingdom", flag: "UK", phoneCode: "+44"),
        .init(name: "Kyrgyzstan", flag: "KG", phoneCode: "+996"),
        .init(name: "Kazakhstan", flag: "KZ", phoneCode: "+7"),
        .init(name: "Russia", flag: "RU", phoneCode: "+7"),
        .init(name: "United States", flag: "USA", phoneCode: "+1"),
        .init(name: "Uzbekistan", flag: "UZ", phoneCode: "+998"),
        .init(name: "Turkey", flag: "TR", phoneCode: "+90"),
        .init(name: "Georgia", flag: "GE", phoneCode: "+995"),
        .init(name: "South Korea", flag: "KR", phoneCode: "+82"),
        .init(name: "UAE", flag: "UAE", phoneCode: "+971")]
    
    var body: some View {
        HStack {
            Menu {
                Picker("Choose Country", selection: $selectedCountry) {
                    ForEach(countries, id: \.self) { country in
                        Text(country.name)
                            .tag(country)
                    }
                }
                .pickerStyle(.menu)
            } label: {
                chooseCountry
            }
            
            TextField("000 000-00-00", text: $phoneNumber)
                .font(.bodyText1())
                .padding(.leading, 8)
                .frame(width: 262, height: 36)
                .background(
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.designColor.appSecondaryBackground))
                .keyboardType(.numberPad)
                .onChange(of: phoneNumber) { newValue in
                    if (!newValue.isEmpty && newValue.count == 10) {
                        isButtonDisabled = false
                    } else {
                        isButtonDisabled = true
                    }
                }
        }
        .padding(.top, 49)
    }
    
    var chooseCountry: some View {
        HStack(spacing: 0) {
            Image(selectedCountry.flag)
                .frame(width: 16, height: 16)
                .cornerRadius(4)
                .padding(.horizontal, 4)
            Text(selectedCountry.phoneCode)
                .font(.bodyText1())
                .foregroundColor(Color.designColor.disabledText)
        }
        .frame(width: 62, height: 36)
        .background(
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.designColor.appSecondaryBackground))
        .padding(.horizontal, 8)
    }
}

struct PhoneNumberInputView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberInputView(selectedCountry: CountryModel(name: "Russia", flag: "RU", phoneCode: "+7"), isButtonDisabled: Binding<Bool>.constant(true)
        )
    }
}
