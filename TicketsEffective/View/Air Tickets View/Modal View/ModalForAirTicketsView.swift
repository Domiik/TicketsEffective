//
//  ModalForAirTicketsView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

struct ModalForAirTicketsView: View {
    
    // MARK: - Properties
    @State var textForTextFieldOne: String = ""
    @State var textForTextFieldTwo: String = ""
    @State private var selectedHeaderIndex: Int? = nil
    @State private var selectedRecIndex: Int? = nil
    
    @StateObject private var viewModelHeader = HeaderViewModel()
    @StateObject private var viewModelRecomend = RecomendationsViewModel()
    @ObservedObject var coordinator: Coordinator
    
    @FocusState private var isTextFieldFocused: Field?
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var userSettings = UserSettings()
    
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                TextFieldModalView(textForTextFieldOne: $textForTextFieldOne, textForTextFieldTwo: $textForTextFieldTwo, isTextFieldFocused: _isTextFieldFocused, placeholderOne: "Откуда - Москва", placeholderTwo: "Куда - Турция")
                    .padding(.top, 30)
                ScrollView(.vertical, showsIndicators: true) {
                    HeaderView()
                        .padding(.vertical)
                    
                    RecomendationsView()
                        .padding(.bottom)
                }
            }
        }
        .onAppear {
            if userSettings.firstPlace.isEmpty {
                textForTextFieldOne = ""
            } else {
                textForTextFieldOne = userSettings.firstPlace
            }
            self.isTextFieldFocused = .textForTextFieldTwo
        }
        .onDisappear {
            self.isTextFieldFocused = nil
        }
    }
    
    
    @ViewBuilder
    func HeaderView() -> some View {
        HStack(alignment: .top) {
            ForEach(viewModelHeader.arrayHeaders, id: \.id) { header in
                Button {
                    selectedHeaderIndex = header.id
                    if selectedHeaderIndex == 1 {
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            coordinator.handleButtonTap(buttonIndex: 1, text1: "", text2: "")
                        }
                    } else if selectedHeaderIndex == 2 {
                        textForTextFieldTwo = header.title
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            coordinator.handleButtonTap(buttonIndex: 2, text1: textForTextFieldOne, text2: header.title)
                        }
                    }
                    if selectedHeaderIndex == 3 {
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            coordinator.handleButtonTap(buttonIndex: 3, text1: "", text2: "")
                        }
                        
                    } else if selectedHeaderIndex == 4 {
                        presentationMode.wrappedValue.dismiss()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            coordinator.handleButtonTap(buttonIndex: 4, text1: "", text2: "")
                        }
                    }
                } label: {
                    HeaderCell(image: header.imageName, title: header.title)
                }
            }
        }
        
    }
    
    @ViewBuilder
    func RecomendationsView() -> some View {
        VStack {
            ForEach(viewModelRecomend.arrayRecomendations, id: \.id) { rec in
                    RecomendationsCell(title: rec.title, subTitle: rec.subTitle, imageName: rec.imageName)
                        .padding(4)
                        .onTapGesture {
                            presentationMode.wrappedValue.dismiss()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                coordinator.handleButtonTap(buttonIndex: 2, text1: textForTextFieldOne, text2: rec.title)
                            }
                        }
    
            }
        }
        .padding()
        .background(Color(asset: .grey3Color))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        
    }
    
}

//#Preview {
//    ModalForAirTicketsView()
//}
