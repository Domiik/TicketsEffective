//
//  UserSettings.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import Foundation

final class UserSettings: ObservableObject {
    
    @Published var firstPlace: String {
        didSet {
            UserDefaults.standard.set(firstPlace, forKey: "firstPlace")
        }
    }
    
    
    init() {
        self.firstPlace = UserDefaults.standard.object(forKey: "firstPlace") as? String ?? ""
    }
}
