//
//  HeaderCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

struct HeaderCell: View {
    
    @State var image: String
    @State var title: String
    
    var body: some View {
        VStack {
            Image(image)
            Text(title)
                .font(AppFont.text2.font)
                .foregroundStyle(Color(asset: .textColor))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 100)
    }
}

#Preview {
    HeaderCell(image: "", title: "")
}
