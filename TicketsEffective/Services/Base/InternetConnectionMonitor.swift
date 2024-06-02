//
//  InternetConnectionMonitor.swift
//  ShelterApp
//
//  Created by Domiik on 09.01.2024.
//

import Foundation
import Network


class Connectivity: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "Connectivity")

    @Published var isConnected: Bool = true

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            // Monitor runs on a background thread so we need to publish
            // on the main thread
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    self.isConnected = true

                } else {
                    self.isConnected = false
                }
            }
        }
        monitor.start(queue: queue)
    }
}
