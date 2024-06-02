//
//  FilterViewModel.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

final class FilterViewModel: ObservableObject {
    
    let arrayFlters = [
        Filters(id: 1, title: "обратно", imageName: Image.ImageForFilter.plus.rawValue),
        Filters(id: 2, title: "дата", imageName: nil),
        Filters(id: 3, title: "1,эконом", imageName: Image.ImageForFilter.human.rawValue),
        Filters(id: 4, title: "фильтр", imageName: Image.ImageForFilter.filter.rawValue)
    ]
    
}


