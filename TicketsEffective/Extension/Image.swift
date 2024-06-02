//
//  Image.swift
//  CherLiga
//
//  Created by Domiik on 26.04.2022.
//


import SwiftUI

extension Image {
    
    enum ImageForCards: Int, CaseIterable {
        case first = 1
        case second
        case third
        
        func imageName() -> String {
             switch self {
             case .first:
                 return "1"
             case .second:
                 return "2"
             case .third:
                 return "3"
             }
        }
    }
    
    init(imageId: Int) {
            guard let imageForCards = ImageForCards(rawValue: imageId) else {
                self.init(systemName: "xmark.circle")
                return
            }
            self.init(imageForCards.imageName())
        }
    
    
    enum Assets: String, RawRepresentable {
        case Profile
        case Hotel
        case Airtickets
        case City
        case Subscriptions
        case Search
        case Airplane
    }
    
    enum SystemAssets: String, RawRepresentable {
        case back = "arrow.backward"
        case swap = "arrow.up.arrow.down"
        case xmark = "xmark"
    }
    
    init(asset: Image.Assets) {
        self.init(asset.rawValue)
    }
    
    init(system: Image.SystemAssets){
        self.init(systemName: system.rawValue)
    }
}


extension UIImage {
    convenience init(asset: Image.Assets) {
        self.init(named: asset.rawValue)!
    }
}
