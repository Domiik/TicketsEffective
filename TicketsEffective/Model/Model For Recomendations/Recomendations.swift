//
//  Recomendations.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import Foundation


// MARK: - Recomendations
struct Recomendations: Codable, Identifiable {
    let id: Int
    
    let title: String
    let subTitle: String
    let imageName: String
}
