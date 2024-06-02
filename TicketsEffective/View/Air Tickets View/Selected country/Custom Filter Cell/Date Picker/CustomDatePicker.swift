//
//  CustomDatePicker.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @State var selectedDate: Date?
    @StateObject private var viewModelFilters = FilterViewModel()
    
    var body: some View {
        if let date = selectedDate {
            HStack(spacing: 2) {
                Text(date.dateToString())
                    .font(AppFont.title4.font)
                    .foregroundStyle(Color(asset: .whiteColor))
            }
            .padding()
            .background(Capsule().fill(Color(asset: .grey3Color)).frame(minWidth: 88, maxHeight: 33).shadow(radius: 3))
            
            .overlay {
                DatePicker(selection: Binding<Date>(
                    get: { date },
                    set: { newValue in
                        selectedDate = newValue
                    }), displayedComponents: .date) {}
                    .labelsHidden()
                    .contentShape(Rectangle())
                    .opacity(0.011)         
            }
        } else {
            FiltersCell(title: viewModelFilters.arrayFlters[0].title, imageName: Image.ImageForFilter.plus.rawValue)
            
                .overlay {
                    DatePicker(selection: Binding<Date>(
                        get: {
                            let date = Date()
                            return date
                        }, set: { newValue in
                            selectedDate = newValue
                        }), displayedComponents: .date) {}
                        .labelsHidden()
                        .contentShape(Rectangle())
                        .opacity(0.011)
                }
        }
        
        
    }
    
   
    
}

#Preview {
    CustomDatePicker()
}
