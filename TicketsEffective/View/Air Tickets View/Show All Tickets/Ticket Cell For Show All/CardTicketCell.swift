//
//  CardTicketCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct CardTicketCell: View {
    
    @State var price: Int
    @State var timeOfPoisoning: String
    @State var timeArrival: String
    @State var airportPoisining: String
    @State var airportArrival: String
    @State var flightTime: String
    @State var hasTransfer: Bool
    @State var badge: String?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading) {
                Text("\(price.formattedMoney()) ₽")
                    .font(AppFont.title1.font)
                    .foregroundStyle(Color(asset: .whiteColor))
                    
                HStack {
                    Rectangle().frame(width: 24, height: 25).cornerRadius(50).foregroundStyle(Color(asset: .redColor))
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            HStack(alignment: .top) {
                                VStack {
                                    Text(timeOfPoisoning.getTimeFromDate())
                                        .font(AppFont.title4.font)
                                        .foregroundStyle(Color(asset: .whiteColor))
                                    Text(airportPoisining)
                                        .font(AppFont.title4.font)
                                        .foregroundStyle(Color(asset: .grey6Color))
                                }
                                Text("-")
                                    .foregroundStyle(Color(asset: .grey6Color))
                                VStack {
                                    Text(timeArrival.getTimeFromDate())
                                        .font(AppFont.title4.font)
                                        .foregroundStyle(Color(asset: .whiteColor))
                                    Text(airportArrival)
                                        .font(AppFont.title4.font)
                                        .foregroundStyle(Color(asset: .grey6Color))
                                }
                               
                            }
                            Spacer()
                            HStack {
                                Text(travelTime(from: timeOfPoisoning, to: timeArrival))
                                    .font(AppFont.text2.font)
                                    .foregroundStyle(Color(asset: .whiteColor))
                                if !hasTransfer {
                                    Text("/Без пересадок")
                                        .font(AppFont.text2.font)
                                        .foregroundStyle(Color(asset: .whiteColor))
                                } else {
                                    
                                }
                            }
                           
                        }
                    }
                }
            }
            .padding()
            .background(Rectangle().fill(Color(asset: .grey1Color)).frame(maxWidth: .infinity, minHeight: 96) .cornerRadius(8).shadow(radius: 3))
            
            if let badge = badge {
                HStack {
                    Text(badge)
                        .font(AppFont.title4.font)
                        .foregroundStyle(Color(asset: .whiteColor))
                        .alignmentGuide(.leading) { _ in -8 }
                        .alignmentGuide(.top) { _ in 10 }
                }
                .padding(4)
                .background(Rectangle().fill(Color(asset: .blueColor)).frame(maxWidth: .infinity) .cornerRadius(50).shadow(radius: 3))
            } else {
                
            }
        }
        .padding(.horizontal)
       
        
    }
    
    
    func travelTime(from startDateString: String, to endDateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let startDate = dateFormatter.date(from: startDateString),
              let endDate = dateFormatter.date(from: endDateString) else {
            return ""
        }
        
        let travelTimeInSeconds = endDate.timeIntervalSince(startDate)
        
        let hours = Int(travelTimeInSeconds) / 3600
        let minutes = (Int(travelTimeInSeconds) % 3600) / 60
        
        return String("\(hours).\(minutes)ч в пути")
    }
}

#Preview {
    CardTicketCell(price: 7386, timeOfPoisoning: "15:00", timeArrival: "18:35", airportPoisining: "DME", airportArrival: "AER", flightTime: "3.5ч в пути", hasTransfer: false, badge: "Прилет вечером")
}
