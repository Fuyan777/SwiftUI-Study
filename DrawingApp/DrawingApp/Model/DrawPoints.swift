//
//  DrawPoints.swift
//  DrawingApp
//
//  Created by 山田楓也 on 2021/01/10.
//

import SwiftUI

struct DrawPoints: Identifiable {
    var points: [CGPoint]
    var color: Color
    var id = UUID()
}

enum DrawColor {
    case red
    case clear

    var color: Color {
        switch self {
            case .red:
                return Color.red
            case .clear:
                return Color.white
        }
    }
}
