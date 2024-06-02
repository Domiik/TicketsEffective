//
//  CustomRoundedShape.swift
//  TicketsEffective
//
//  Created by Владимир Иванов on 03.06.2024.
//

import SwiftUI

struct CustomRoundedShape: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
