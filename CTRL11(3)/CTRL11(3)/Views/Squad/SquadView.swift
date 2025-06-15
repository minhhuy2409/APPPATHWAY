//
//  SquadView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct SquadView: View {
    // Nhận @Binding và các closures
    @Binding var players: [Player]
    let onAddPlayer: (Player) -> Void
    let onDeletePlayer: (IndexSet) -> Void // <- Nhận closure xóa ở đây
    
    @State private var showingAddPlayerSheet = false

    var body: some View {
        NavigationView {
            List {
                ForEach(players) { player in
                    NavigationLink(destination: PlayerProfileView(player: player)) {
                        PlayerRowView(player: player)
                    }
                }
                // SỬ DỤNG MODIFIER .onDelete ĐỂ KÍCH HOẠT CHỨC NĂNG VUỐT XÓA
                .onDelete(perform: onDeletePlayer)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("SQUAD")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddPlayerSheet = true }) {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingAddPlayerSheet) {
                AddPlayerView(onSave: onAddPlayer)
            }
        }
    }
}
