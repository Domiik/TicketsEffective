//
//  TicketCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct TicketCell: View {
    
    @State var title: String
    @State var price: Int
    @State var timeRange: [String]
    @State var color: Color.Assets
    
    var body: some View {
        HStack {
            Rectangle().frame(width: 24, height: 25).cornerRadius(50).foregroundStyle(Color(asset: color))
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .font(AppFont.title4.font)
                        .foregroundStyle(Color(asset: .whiteColor))
                    Spacer()
                    Text("\(price.formattedMoney()) ₽")
                        .font(AppFont.title4.font)
                        .foregroundStyle(Color(asset: .blueColor))
                }
                HStack {
                    Text(timeRange.joined(separator: ", "))
                                .font(AppFont.text2.font)
                                .foregroundStyle(Color(asset: .whiteColor))
                                .lineLimit(1)
                                .truncationMode(.tail)
                }
                Divider()
                    .frame(height: 1)
                    .background(Color(asset: .grey4Color))
                    .padding(.horizontal)
               
            }
        }
    }
}

//#Preview {
//    TicketCell(title: "", price: "", subTitle: "")
//}
