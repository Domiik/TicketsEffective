//
//  FiltersCell.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct FiltersCell: View {
    
    @State var title: String
    @State var imageName: String?

    var body: some View {
        HStack {
            if let imageName = imageName {
                Image(imageName)
            } else {
                
            }
            Text(title)
                .font(AppFont.title4.font)
                .foregroundStyle(Color(asset: .whiteColor))
        }
        .padding()
        .background(Capsule().fill(Color(asset: .grey3Color)).frame(minWidth: 88, maxHeight: 33).shadow(radius: 3))
    }
}

#Preview {
    FiltersCell(title: "sadasd")
}
