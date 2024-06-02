//
//  Date.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMM, E"
        return formatter.string(from: self)
    }
    
    func dateToStringForAllTickets() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "d MMMM"
        return formatter.string(from: self)
    }
}
