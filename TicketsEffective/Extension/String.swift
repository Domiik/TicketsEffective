//
//  String.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import Foundation


extension String {
    
    func getTimeFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"

        guard let date = dateFormatter.date(from: self) else {
            return ""
        }

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        
        return timeFormatter.string(from: date)
    }
}
