//
//  Filters.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import Foundation

// MARK: - Filters
struct Filters: Codable, Identifiable {
    let id: Int
    
    let title: String
    let imageName: String?
}
