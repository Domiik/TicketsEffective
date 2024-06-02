//
//  Coordinator.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

class Coordinator: ObservableObject {
    
    enum Destination: Hashable {
        case placeholder
        case contineView(String, String)
    }
    
    enum Router: Hashable {
        case showAllTickets(String, String, Date, String)
    }
    
    @Published var showFullScreen: Bool = false
    @Published var path: [Destination] = []
    
    func navigate(to destination: Destination) {
        path.append(destination)
    }
    
    func goBack() {
        path.removeLast()
    }
    
    func handleButtonTap(buttonIndex: Int, text1: String, text2: String) {
            switch buttonIndex {
            case 1, 3, 4:
                path.append(.placeholder)
            case 2:
                path.append(.contineView(text1, text2))
            default:
                break
            }
    }
    
    static func navigate<T: View>(_ route: Router, content: () -> T) -> AnyView {
        switch route {
        case .showAllTickets(let cityOne, let cityTwo, let date, let coutPeople):
            return AnyView(
                NavigationLink(
                    destination: ShowAllTicketsView(textCityFirst: cityOne, textCitySecond: cityTwo, date: date, countPeople: coutPeople),
                    label: {
                        content()
                    }
                )
            )
        }
    }
}
