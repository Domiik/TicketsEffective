//
//  RecomendationsCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

struct RecomendationsCell: View {
    
    @State var title: String
    @State var subTitle: String
    @State var imageName: String
    
    var body: some View {
        VStack {
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(8)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(AppFont.title3.font)
                        .foregroundStyle(Color(asset: .textColor))
                    Text(subTitle)
                        .font(AppFont.text2.font)
                        .foregroundStyle(Color(asset: .grey5Color))
                
                }
                Spacer()
            }
            Divider()
                .frame(height: 1)
                .background(Color(asset: .grey4Color))
                .padding(.horizontal)
        }
       
    }
}

#Preview {
    RecomendationsCell(title: "", subTitle: "", imageName: "")
}
