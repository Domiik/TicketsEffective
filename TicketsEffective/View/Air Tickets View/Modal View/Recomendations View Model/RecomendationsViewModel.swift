//
//  RecomendationsViewModel.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//


import SwiftUI

final class RecomendationsViewModel: ObservableObject {
    
    let arrayRecomendations = [
        Recomendations(id: 1, title: "Стамбул", subTitle: "Популяное направление", imageName: Image.ImageForRecomendations.stambul.rawValue),
        Recomendations(id: 2, title: "Сочи", subTitle: "Популяное направление", imageName: Image.ImageForRecomendations.sochi.rawValue),
        Recomendations(id: 3, title: "Пхукет", subTitle: "Популяное направление", imageName: Image.ImageForRecomendations.phuket.rawValue),
    ]
    
}
