//
//  AirTicketsViewModel.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import Foundation

final class AirTicketsViewModel: ObservableObject {
    
    enum State {
        case idle
        case loading
        case end
        case error
    }
    
    @Published var alertItem: APError?
    @Published var offers: [Offer] = []
    @Published private(set) var state = State.idle
    
    private let offersManager = GetOffers()
    
    func getOffers() {
        self.state = .loading
        offersManager.getOffers { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    guard let self = self else { return }
                    self.offers = data.offers
                    print(self.offers)
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
