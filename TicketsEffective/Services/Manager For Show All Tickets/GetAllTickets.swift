//
//  GetAllTickets.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//

import SwiftUI

class GetAllTickets {
    
    @ObservedObject var connectivity    = Connectivity()
    
    func getAllTickets(completed: @escaping (Result<AllTickets, APError>) -> Void) {
        if connectivity.isConnected {
            
            let endURL = URLComponents(string: Constants.allTicketsURL)!
                    
            guard let url = endURL.url else {
                completed(.failure(.invalidURL))
                return
            }
        
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                if let _ =  error {
                    completed(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completed(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completed(.failure(.invalidData))
                    return
                }
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(AllTickets.self, from: data)
                    completed(.success(decodedResponse))
                } catch {
                    completed(.failure(.invalidData))
                    if let decodingError = error as? DecodingError {
                        // Обработка ошибок декодирования JSON
                        switch decodingError {
                        case .dataCorrupted(let context):
                            print("Data corrupted:", context.debugDescription)
                        case .keyNotFound(let key, let context):
                            print("Key '\(key.stringValue)' not found:", context.debugDescription)
                        case .typeMismatch(let type, let context):
                            let keyPathString = context.codingPath.map { $0.stringValue }.joined(separator: " > ")
                            print("Type mismatch at key path: \(keyPathString), expected type: \(type)")
                        case .valueNotFound(let type, let context):
                            print("Value not found for type '\(type)'", context.debugDescription)
                        @unknown default:
                            print("Unknown decoding error occurred")
                        }
                    } else {
                        // Обработка других ошибок
                        print("Error decoding JSON:", error.localizedDescription)
                    }
                }
            }
            
            task.resume()
        } else {
            completed(.failure(.internetConnection))
        }
    }
    
}
