//
//  TicketsViewModel.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import Foundation

final class TicketsViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case end
        case error
    }
    
    @Published var alertItem: APError?
    @Published var tickets: [TicketsOffer] = []
    @Published private(set) var state = State.idle
    
    private let ticketsManager = GetTickets()
    
    func getTickets() {
        self.state = .loading
        ticketsManager.getTickets { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let self = self else { return }
                    self.tickets = data.ticketsOffers
                    print(self.tickets)
                    self.state = .end
                case .failure(let error):
                    guard let self = self else { return }
                    self.state = .error
                    switch error {
                    case .invalidData:
                        self.alertItem = .invalidData
                    case .invalidURL:
                        self.alertItem = .invalidURL
                    case .invalidResponse:
                        self.alertItem = .invalidResponse
                    case .unableToComplete:
                        self.alertItem = .unableToComplete
                    case .internetConnection:
                        self.alertItem = .internetConnection
                    }
                }
            }
        }
    }
}
