//
//  PlayerProfileView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct PlayerProfileView: View {
    let player: Player

    var body: some View {
        List {
            Section(header: Text("Basic Info")) {
                HStack { Text("Height"); Spacer(); Text("\(player.height) cm").foregroundColor(.secondary) }
                HStack { Text("Weight"); Spacer(); Text("\(player.weight) kg").foregroundColor(.secondary) }
                HStack { Text("Position"); Spacer(); Text(player.position).foregroundColor(.secondary) }
            }

            Section(header: Text("Skills")) {
                // Lặp qua dictionary skills của cầu thủ
                ForEach(player.skills.keys.sorted(), id: \.self) { key in
                    HStack {
                        Text(key)
                        Spacer()
                        // Hiển thị đánh giá sao, không cho phép chỉnh sửa ở đây
                        // .constant() tạo một binding chỉ đọc
                        StarRatingView(rating: .constant(player.skills[key] ?? 0))
                    }
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle(player.name)
    }
}
