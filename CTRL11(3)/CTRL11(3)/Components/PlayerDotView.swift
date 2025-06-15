//
//  PlayerDotView.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

struct PlayerDotView: View {
    @Binding var playerPosition: PlayerPosition
    var geometry: GeometryProxy

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white)
                .shadow(color: .black.opacity(0.4), radius: 3, x: 0, y: 2)
            Text("\(playerPosition.number)")
                .foregroundColor(.black)
                .fontWeight(.bold)
        }
        .frame(width: 35, height: 35)
        .position(
            x: playerPosition.position.x * geometry.size.width,
            y: playerPosition.position.y * geometry.size.height
        )
        .gesture(
            DragGesture()
                .onChanged { value in
                    let newX = min(max(value.location.x, 0), geometry.size.width)
                    let newY = min(max(value.location.y, 0), geometry.size.height)
                    
                    self.playerPosition.position = CGPoint(
                        x: newX / geometry.size.width,
                        y: newY / geometry.size.height
                    )
                }
        )
    }
}
