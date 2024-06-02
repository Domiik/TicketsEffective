//
//  TextFieldCityChange.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 31.05.2024.
//

import SwiftUI

struct TextFieldCityChange: View {
    
    @Binding var textForTextFieldOne: String
    @Binding var textForTextFieldTwo: String
    @Binding var isModalPresented: Bool
    
    @StateObject var userSettings = UserSettings()
    
    var placeholderOne: String
    var placeholderTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Image(asset: .Search)
                    .padding()
                VStack {
                    TextField("", text: $textForTextFieldOne,
                              prompt: Text(placeholderOne)
                                        .foregroundColor(Color(asset: .grey6Color))
                                        .font(AppFont.buttonText1.font)
                            )
                    .keyboardType(.default)
                    .onChange(of: textForTextFieldOne) { newValue in
                        userSettings.firstPlace = newValue
                    }
                    .foregroundColor(Color(asset: .whiteColor))
                    Divider()
                        .frame(minHeight: 1)
                        .background(Color(asset: .whiteColor))
                        .padding(.trailing)
                    
                    TextField("", text: $textForTextFieldTwo,
                              prompt: Text(placeholderTwo)
                                        .foregroundColor(Color(asset: .grey6Color))
                                        .font(AppFont.buttonText1.font)
                            )
                    .keyboardType(.default)
                    .foregroundColor(Color(asset: .whiteColor))
                    .onTapGesture {
                        self.isModalPresented = true
                    }
                }
            }
            .background(Rectangle().fill(Color(asset: .grey4Color)).frame(maxWidth: .infinity, minHeight: 90) .cornerRadius(16).shadow(radius: 3))
            .padding(.horizontal)
        }
        .background(Rectangle().fill(Color(asset: .grey3Color)).frame(maxWidth: .infinity, minHeight: 122) .cornerRadius(16))
           
    }
}

#Preview {
    TextFieldCityChange(textForTextFieldOne: .constant(" "), textForTextFieldTwo: .constant(" "), isModalPresented: .constant(false), placeholderOne: "Gtbhasdadsd", placeholderTwo: "dsadasd")
}
