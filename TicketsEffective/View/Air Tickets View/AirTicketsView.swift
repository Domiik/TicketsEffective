//
//  AirTicketsView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 31.05.2024.
//

import SwiftUI

struct AirTicketsView: View {
    
    // MARK: - Properties
    @State var textForTextFieldOne: String = ""
    @State var textForTextFieldTwo: String = ""
    @State private var isModalPresented = false

    
    @StateObject private var viewModel = AirTicketsViewModel()
    @StateObject private var coordinator = Coordinator()
    
    @StateObject var userSettings = UserSettings()
    
    
    var body: some View {
        // MARK: State for air view model
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear {
                viewModel.getOffers()
            }
        case .loading:
            ProgressView()
                .padding()
        case .end:
            NavigationStack(path: $coordinator.path) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("Поиск дешевых\nавиабилетов")
                            .font(AppFont.title1.font)
                            .foregroundStyle(Color(asset: .textColor))
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                            .padding()
                            .padding(.bottom, 30)
                        TextFieldCityChange(textForTextFieldOne: $textForTextFieldOne, textForTextFieldTwo: $textForTextFieldTwo, isModalPresented: $isModalPresented, placeholderOne: "Откуда - Москва", placeholderTwo: "Куда - Турция")
                            .padding()
                        
                        HStack {
                            Text("Музыкально отлететь")
                                .font(AppFont.title1.font)
                                .foregroundStyle(Color(asset: .textColor))
                                .padding()
                            Spacer()
                        }
                        .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 10) {
                                ForEach(viewModel.offers, id: \.id) { offer in
                                    MusicCardCell(idForImage: offer.id, title: offer.title, city: offer.town, price: offer.price.value)
                                        .padding()
                                }
                            }
                        }
                    }
                }
                .sheet(isPresented: $isModalPresented) {
                    ModalForAirTicketsView(coordinator: coordinator)
                        .onDisappear {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)// Закрыть клавиатуру при закрытии модального окна
                        }
                }
                .navigationDestination(for: Coordinator.Destination.self) { route in
                    switch route {
                    case .placeholder:
                        StubView()
                    case .contineView(let text1, let text2):
                       CountrySelectedView(textForTextFieldOne: text1, textForTextFieldTwo: text2, placeholderOne: "Куда", placeholderTwo: "Откуда")
                    }
                }
            }
            .onAppear {
                if userSettings.firstPlace.isEmpty {
                    textForTextFieldOne = ""
                } else {
                    textForTextFieldOne = userSettings.firstPlace
                }
            }
        case .error:
            ErrorView {
                viewModel.getOffers()
            }
        }
        
    }
}

#Preview {
    AirTicketsView(textForTextFieldOne: "", textForTextFieldTwo: "")
}
