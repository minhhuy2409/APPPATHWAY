//
//  Coach.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import Foundation
import SwiftUI

struct Coach: Identifiable {
    let id = UUID()
    var name: String
    var teamName: String
    var email: String
    
    // THÊM MỚI CÁC THUỘC TÍNH
    var phoneNumber: String
    var favoriteFormation: Formation
    var experience: String
    var imageData: Data?
    
    let avatarSystemIcon: String
    let wins: Int
    let draws: Int
    let losses: Int
    
    // Thuộc tính tính toán cho ảnh
    var coachImage: Image {
        if let data = imageData, let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        }
        return Image(systemName: avatarSystemIcon)
    }
}
