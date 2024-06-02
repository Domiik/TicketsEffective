//
//  HeaderViewModel.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

final class HeaderViewModel: ObservableObject {
    
    let arrayHeaders = [
        Headers(id: 1, title: "Сложный маршрут", imageName: Image.ImageForHeader.first.rawValue),
        Headers(id: 2, title: "Куда угодно", imageName: Image.ImageForHeader.second.rawValue),
        Headers(id: 3, title: "Выходные", imageName: Image.ImageForHeader.third.rawValue),
        Headers(id: 4, title: "Горячие билеты", imageName: Image.ImageForHeader.fourth.rawValue)
    ]
    
}
