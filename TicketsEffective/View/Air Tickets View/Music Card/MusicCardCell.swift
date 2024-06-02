//
//  MusicCardCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 31.05.2024.
//

import SwiftUI

struct MusicCardCell: View {
    
    @State var idForImage: Int
    @State var title: String
    @State var city: String
    @State var price: Int
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageId: idForImage)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .cornerRadius(16)
            Text(title)
                .font(AppFont.title3.font)
                .foregroundStyle(Color(asset: .textColor))
                .padding(.vertical, 4)
            Text(city)
                .font(AppFont.text2.font)
                .foregroundStyle(Color(asset: .textColor))
                .padding(.vertical, 4)
            HStack {
                Image(asset: .Airtickets)
                Text("от " + price.formattedMoney() + " ₽")
                    .font(AppFont.text2.font)
                    .foregroundStyle(Color(asset: .textColor))
            }
        }
    }
}

#Preview {
    MusicCardCell(idForImage: 1, title: "Die Antwoord", city: "Будапешт", price: 22445)
}
