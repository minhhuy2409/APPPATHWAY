//
//  Player.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import Foundation
import SwiftUI

struct Player: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var position: String
    var height: Int
    var weight: Int
    var skills: [String: Int]
    
    // THÊM MỚI: Dữ liệu ảnh, là optional vì có thể cầu thủ không có ảnh
    var imageData: Data?
    
    // Thuộc tính tính toán để dễ dàng lấy ảnh ra
    var playerImage: Image {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: "person.fill")
    }
}
