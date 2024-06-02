//
//  ShowAllTicketsView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct ShowAllTicketsView: View {
    
    var textCityFirst: String
    var textCitySecond: String
    var date: Date
    var countPeople: String
    
    @StateObject private var viewModel = ShowAllTicketsViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            BackAndInfoView()
                .padding(.vertical)
        }
        .padding(.top)
        switch viewModel.state {
        case .idle:
            Color.clear.onAppear {
                viewModel.getAllTickets()
            }
        case .loading:
            ProgressView()
                .padding()
        case .end:
            ZStack(alignment:.bottom ) {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 1) {
                        ForEach(viewModel.allTickets, id: \.id) { ticket in
                            CardTicketCell(price: ticket.price.value, timeOfPoisoning: ticket.departure.date, timeArrival: ticket.arrival.date, airportPoisining: ticket.departure.airport.rawValue, airportArrival: ticket.arrival.airport.rawValue, flightTime: "3.5", hasTransfer: ticket.hasTransfer, badge: ticket.badge)
                                .padding(.vertical, 4)
                        }
                    }
                    Spacer(minLength: 40)
                }
               
                HStack(spacing: 0) {
                    Button {
                        
                    } label: {
                        Image(rec: .filter)
                            .foregroundStyle(Color(asset: .whiteColor))
                            .padding(.leading)
                        Text("Фильтр")
                            .font(AppFont.buttonText1.font)
                            .foregroundColor(Color(asset: .whiteColor))
                            .padding(.vertical)
                    }
                    .background(Color(asset: .blueColor))
                    .clipShape(CustomRoundedShape(corners: [.topLeft, .bottomLeft], radius: 15))

                    Button {
                        
                    } label: {
                        Image(rec: .price)
                            .foregroundStyle(Color(asset: .whiteColor))
                            .padding(.leading)
                        Text("График цен")
                            .font(AppFont.buttonText1.font)
                            .foregroundColor(Color(asset: .whiteColor))
                            .padding([.vertical, .trailing])
                    }
                    .background(Color(asset: .blueColor))
                    .clipShape(CustomRoundedShape(corners: [.topRight, .bottomRight], radius: 15))

                }
                
                
            }
            .navigationBarBackButtonHidden(true)
        case .error:
            ErrorView {
                viewModel.getAllTickets()
            }
        }
       
    }
    
    
    @ViewBuilder
    func BackAndInfoView() -> some View {
        VStack {
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(system: .back)
                        .font(AppFont.title1.font)
                        .foregroundStyle(Color(asset: .blueColor))
                        .padding(.leading)
                }
                
                VStack(alignment: .leading) {
                    Text("\(textCityFirst)-\(textCitySecond)")
                        .foregroundColor(Color(asset: .whiteColor))
                        .font(AppFont.title3.font)
                    Text("\(date.dateToStringForAllTickets()),\(countPeople)")
                        .foregroundColor(Color(asset: .grey6Color))
                        .font(AppFont.title4.font)
                }
                Spacer()
            }
            
        }
        .background(Rectangle().fill(Color(asset: .grey2Color)).frame(maxWidth: .infinity, minHeight: 60).shadow(radius: 3))
        .padding(.horizontal)
    }
}

#Preview {
    ShowAllTicketsView(textCityFirst: "Москва", textCitySecond: "Москва", date: Date.now, countPeople: "Москва")
}
