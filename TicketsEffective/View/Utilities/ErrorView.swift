//
//  ErrorView.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 03.06.2024.
//

import SwiftUI

struct ErrorView: View {
    
    @State var error: APError?
    var retryAction: () -> Void
    
    var body: some View {
        switch error {
        default :
            Text("Ошибка")
                .bold()
                .foregroundColor(Color(asset: .textColor))
            Button(action: retryAction) {
                Text("Ошибка")
                    .foregroundColor(Color(asset: .textColor))
            }
            .padding()
            .background(Color(asset: .redColor))
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
    }
}

//#Preview {
//    ErrorView()
//}
