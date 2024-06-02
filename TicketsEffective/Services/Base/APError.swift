//
//  APError.swift
//  ShelterApp
//
//  Created by Domiik on 09.01.2024.
//

import SwiftUI

enum APError: Error {
    case invalidURL
    case unableToComplete
    case invalidResponse
    case invalidData
    case internetConnection
}
