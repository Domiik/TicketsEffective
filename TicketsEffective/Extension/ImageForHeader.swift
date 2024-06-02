//
//  ImageForHeader.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 01.06.2024.
//

import SwiftUI

extension Image {
    
    enum ImageForHeader: String, RawRepresentable {
        case first
        case second
        case third
        case fourth
    }
    
    
    init(header: Image.ImageForHeader) {
        self.init(header.rawValue)
    }
    
}
