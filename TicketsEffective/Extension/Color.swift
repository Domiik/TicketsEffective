//
//  Color.swift
//  CherLiga
//
//  Created by Domiik on 26.04.2022.
//

import SwiftUI


extension Color {
    
    enum Assets: String, RawRepresentable {
        case blackColor
        case blueColor
        case darkBlueColor
        case darkGreenColor
        case greenColor
        case grey1Color
        case grey2Color
        case grey3Color
        case grey4Color
        case grey5Color
        case grey6Color
        case grey7Color
        case redColor
        case orangeColor
        case shadowColor
        case whiteColor
        case textColor
    }
    
    init(asset: Color.Assets) {
        self.init(asset.rawValue)
    }
    
}


extension UIColor {
    convenience init(asset: Color.Assets) {
        self.init(named: asset.rawValue)!
    }
}
