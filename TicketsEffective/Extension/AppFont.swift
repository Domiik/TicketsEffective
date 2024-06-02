//
//  Font.swift
//  CherLiga
//
//  Created by Domiik on 26.04.2022.
//

import SwiftUI

public enum AppFont {
    case title1
    case title2
    case title3
    case title4
    case text1
    case text2
    case buttonText1
    case tabText
}

public extension AppFont {
    var font: Font {
        switch self {
        case .title1:
             return Font.custom("SF-Pro-Display-Semibold", size: 22)
        case .title2:
            return Font.custom("SF-Pro-Display-Semibold", size: 20)
        case .title3:
            return Font.custom("SF-Pro-Display-Medium", size: 16)
        case .title4:
            return Font.custom("SF-Pro-Display-Regular", size: 14)
        case .text1:
            return Font.custom("SF-Pro-Display-Regular", size: 16)
        case .text2:
            return Font.custom("SF-Pro-Display-Semibold", size: 14)
        case .buttonText1:
            return Font.custom("SF-Pro-Display-Regular", size: 16)
        case .tabText:
            return Font.custom("SF-Pro-Display-Regular", size: 10)
        }
    }
}
