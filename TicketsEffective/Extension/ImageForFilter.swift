//
//  ImageForFilter.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 02.06.2024.
//


import SwiftUI

extension Image {
    
    enum ImageForFilter: String, RawRepresentable {
        case plus
        case human
        case filter
        case price
    }
    
    
    init(rec: Image.ImageForFilter) {
        self.init(rec.rawValue)
    }
    
}
