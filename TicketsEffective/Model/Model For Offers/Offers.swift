//
//  Offers.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 31.05.2024.
//

import Foundation

// MARK: - Offers
struct Offers: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable {
    let id: Int
    let title, town: String
    let price: Price
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
