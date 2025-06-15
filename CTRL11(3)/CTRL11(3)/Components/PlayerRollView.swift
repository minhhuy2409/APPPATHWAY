//
//  PlayerRollView.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

struct PlayerRowView: View {
    let player: Player
    
    var body: some View {
        HStack(spacing: 16) {
            // Sử dụng thuộc tính tính toán playerImage
            player.playerImage
                .resizable()
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                .background(Circle().fill(Color.gray.opacity(0.3))) // Nền cho icon mặc định
            
            VStack(alignment: .leading, spacing: 4) {
                Text(player.name)
                    .fontWeight(.bold)
                Text(player.position)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 4)
    }
}
