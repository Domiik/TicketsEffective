//
//  CountrySelectedView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct CountrySelectedView: View {
    
    @State var textForTextFieldOne: String
    @State var textForTextFieldTwo: String
    @State private var selectedFilterIndex: Int? = nil
    
    var placeholderOne: String
    var placeholderTwo: String
    
    @State private var selectedDate = Date()
    @State private var isDatePickerActive = false
    
    
    @StateObject private var viewModel = TicketsViewModel()
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var viewModelFilters = FilterViewModel()
    
    var body: some View {
        
        
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear {
                viewModel.getTickets()
            }
        case .loading:
            ProgressView()
                .padding()
        case .end:
            VStack {
                SearchView()
                    .padding(.top, 30)
                
                FilterView()
                
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    DirectFlightsView()
                    
                    Coordinator.navigate(.showAllTickets(textForTextFieldOne, textForTextFieldTwo, selectedDate, "1 пассажир")) {
                        HStack {
                            Spacer()
                            Text("Посмотреть все билеты")
                                .font(AppFont.buttonText1.font)
                                .foregroundColor(Color(asset: .whiteColor))
                                .padding()
                            Spacer()
                        }
                        .background(Color(asset: .blueColor))
                        .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                        .padding()
                        
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
        case .error:
            ErrorView {
                viewModel.getTickets()
            }
        }
        
        
        // MARK: State for air view model
        
        
        
    }
    
    
    @ViewBuilder
    func FilterView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(alignment: .top) {
                
                CustomDatePicker(selectedDate: nil)
                    .padding(.leading)
                
                CustomDatePicker(selectedDate: selectedDate)
                    .padding(.leading)
                
                FiltersCell(title: viewModelFilters.arrayFlters[2].title, imageName: viewModelFilters.arrayFlters[2].imageName)
                    .padding(.leading)
                FiltersCell(title: viewModelFilters.arrayFlters[3].title, imageName: viewModelFilters.arrayFlters[3].imageName)
                    .padding(.leading)
                
            }
            .padding(.vertical)
        }
        .frame(height: 70)
    }
    
    @ViewBuilder
    func SearchView() -> some View {
        VStack {
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(system: .back)
                        .font(AppFont.title1.font)
                        .foregroundStyle(Color(asset: .whiteColor))
                        .padding(.leading)
                }
                
                VStack {
                    TextField("", text: $textForTextFieldOne,
                              prompt: Text(placeholderOne)
                        .foregroundColor(Color(asset: .whiteColor))
                        .font(AppFont.buttonText1.font)
                    )
                    .foregroundColor(Color(asset: .whiteColor))
                    .overlay(
                        Button(action: {
                            swap(&textForTextFieldOne, &textForTextFieldTwo)
                        }) {
                            Image(system: .swap)
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                            .padding(.trailing, 5)
                            .opacity($textForTextFieldTwo.wrappedValue.isEmpty ? 0 : 1), // Скрыть кнопку, если текстовое поле пустое
                        alignment: .trailing
                    )
                    .padding(.vertical, 4)
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color(asset: .grey4Color))
                        .padding(.horizontal)
                    
                    TextField("", text: $textForTextFieldTwo, prompt: Text(placeholderTwo)  .foregroundColor(Color(asset: .whiteColor)).font(AppFont.buttonText1.font))
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
                        .padding(.vertical, 4)
                }
                
            }
            
        }
        .background(Rectangle().fill(Color(asset: .grey3Color)).frame(maxWidth: .infinity, minHeight: 96) .cornerRadius(16).shadow(radius: 3))
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func DirectFlightsView() -> some View {
        let colors: [Color.Assets] = [.redColor, .blueColor, .whiteColor]
        VStack(alignment: .leading) {
            Text("Прямые рейсы")
                .foregroundColor(Color(asset: .whiteColor))
                .font(AppFont.title2.font)
            ForEach(Array(viewModel.tickets.enumerated()), id: \.element.id) { index, ticket in
                TicketCell(title: ticket.title, price: ticket.price.value, timeRange: ticket.timeRange, color: colors[index])
            }
            HStack {
                Spacer()
                Text("Покзать все")
                    .foregroundColor(Color(asset: .blueColor))
                    .font(AppFont.title2.font)
                Spacer()
            }
            .padding(.vertical, 5)
            
        }
        .padding()
        .background(Color(asset: .grey3Color))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        
    }
}

#Preview {
    CountrySelectedView(textForTextFieldOne: "", textForTextFieldTwo: "", placeholderOne: "", placeholderTwo: "")
}
