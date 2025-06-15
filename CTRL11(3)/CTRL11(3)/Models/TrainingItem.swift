//
//  TrainingItem.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import Foundation

enum TrainingCategory: String, CaseIterable, Identifiable {
    case attack = "ATTACK ⚽️"
    case defend = "DEFENSE 🛡️"
    case control = "CONTROL 🧠"
    case physical = "PHYSICAL 💪"
    
    var id: String { self.rawValue }
}

struct TrainingItem: Identifiable, Hashable {
    let id: UUID
    var name: String
    var category: TrainingCategory
    
    // THÊM MỚI: Các thuộc tính chi tiết
    var playersNeeded: String
    var time: String
    var description: String
}
