//
//  TextFieldModalView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

enum Field {
    case textForTextFieldTwo
}


struct TextFieldModalView: View {
    
    @Binding var textForTextFieldOne: String
    @Binding var textForTextFieldTwo: String
    @FocusState var isTextFieldFocused: Field?
    
    var placeholderOne: String
    var placeholderTwo: String
    
    
    var body: some View {
        VStack {
            HStack {
                Image(asset: .Airplane)
                    .padding(.leading)
                TextField("", text: $textForTextFieldOne,
                          prompt: Text(placeholderOne)
                                    .foregroundColor(Color(asset: .grey6Color))
                                    .font(AppFont.buttonText1.font)
                        )
                .foregroundColor(Color(asset: .whiteColor))
            }
            .padding(.vertical, 4)
            Divider()
                .frame(height: 1)
                .background(Color(asset: .grey4Color))
                .padding(.horizontal)
            HStack {
                Image(asset: .Search)
                    .foregroundStyle(Color(asset: .whiteColor))
                    .padding(.leading)
                TextField("", text: $textForTextFieldTwo, prompt: Text(placeholderOne)  .foregroundColor(Color(asset: .grey6Color)).font(AppFont.buttonText1.font))
                    .overlay(
                        Button(action: {
                            $textForTextFieldTwo.wrappedValue = ""
                        }) {
                            Image(system: .xmark)
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                            .padding(.trailing, 5)
                            .opacity($textForTextFieldTwo.wrappedValue.isEmpty ? 0 : 1), // Скрыть кнопку, если текстовое поле пустое
                        alignment: .trailing
                    )
                .focused($isTextFieldFocused, equals: .textForTextFieldTwo)
            }
            .padding(.vertical, 4)
        }
        .background(Rectangle().fill(Color(asset: .grey3Color)).frame(maxWidth: .infinity, minHeight: 96) .cornerRadius(16).shadow(radius: 3))
        .padding(.horizontal)
           
    }
}

#Preview {
    TextFieldModalView(textForTextFieldOne: .constant(""), textForTextFieldTwo: .constant(""), placeholderOne: "", placeholderTwo: "")
}
