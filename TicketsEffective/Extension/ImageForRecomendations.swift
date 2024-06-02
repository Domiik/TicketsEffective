//
//  ImageForRecomendations.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//


import SwiftUI

extension Image {
    
    enum ImageForRecomendations: String, RawRepresentable {
        case stambul
        case sochi
        case phuket
    }
    
    
    init(rec: Image.ImageForRecomendations) {
        self.init(rec.rawValue)
    }
    
}
