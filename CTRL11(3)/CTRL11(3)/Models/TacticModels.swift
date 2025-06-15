//
//  TacticsModels.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

struct PlayerPosition: Identifiable {
    let id = UUID()
    var number: Int
    var position: CGPoint
}

// MỞ RỘNG: Thêm nhiều đội hình và biến thể
enum Formation: String, CaseIterable, Identifiable {
    // 4 Hậu vệ
    case f442 = "4-4-2"
    case f433_Holding = "4-3-3 (Holding)"
    case f433_False9 = "4-3-3 (False 9)"
    case f4231 = "4-2-3-1"
    case f4141 = "4-1-4-1"
    case f442_Diamond = "4-4-2 (Diamond)"

    // 3 Hậu vệ
    case f352 = "3-5-2"
    case f343 = "3-4-3"
    
    // 5 Hậu vệ
    case f532 = "5-3-2"
    case f541 = "5-4-1"

    var id: String { self.rawValue }

    // Cập nhật mô tả chiến thuật tương ứng
    var description: String {
        switch self {
        case .f442: return "Classic balance, two solid banks of four."
        case .f433_Holding: return "Dominant midfield with a defensive anchor (CDM)."
        case .f433_False9: return "Fluid attack, creates space by dropping the striker deep."
        case .f4231: return "Flexible attack with a central CAM playmaker."
        case .f4141: return "Compact defensive shape, strong counter-attack."
        case .f442_Diamond: return "Narrow midfield, overloads the center, relies on full-backs for width."
        case .f352: return "Controls the midfield with wing-backs providing width."
        case .f343: return "High-pressure, all-out attack, vulnerable on the counter."
        case .f532: return "Solid defense, uses wing-backs to join the attack."
        case .f541: return "Ultra-defensive 'park the bus', aims for 1-0 wins."
        }
    }
}
