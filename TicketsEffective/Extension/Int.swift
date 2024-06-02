//
//  Int.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 03.06.2024.
//

import Foundation

extension Int {
    
    func formattedMoney() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.groupingSeparator = " "
        numberFormatter.groupingSize = 3

        return numberFormatter.string(from: NSNumber(value: self)) ?? "\(self)"
    }
}
