//
//  ContentView.swift
//  CTRL11(3)
//
//  Created by huy bin on 14/6/25.
//

import SwiftUI

enum StoredColorScheme: Int {
    case light = 0
    case dark = 1
}

struct ContentView: View {
    @State private var coach: Coach = MockData.coach
    @State private var players: [Player] = MockData.players
    @State private var trainingItems: [TrainingItem] = MockData.trainingItems
    @State private var playerPositions: [PlayerPosition] = MockData.getFormationPositions(for: .f433_Holding)
    @State private var selectedFormation: Formation = .f433_Holding
    
    @AppStorage("appColorScheme") private var storedColorScheme: StoredColorScheme = .dark

    var body: some View {
        TabView {
            SquadView(
                players: $players,
                onAddPlayer: addPlayer,
                onDeletePlayer: deletePlayer
            )
            .tabItem { Label("SQUAD", systemImage: "person.3.fill") }
            
            TacticsView(
                playerPositions: $playerPositions,
                selectedFormation: $selectedFormation,
                onSetFormation: setFormation
            )
            .tabItem { Label("TACTICS", systemImage: "sportscourt.fill") }

            TrainingView(
                trainingItems: $trainingItems,
                onSaveItem: saveTrainingItem,
                onDeleteItem: deleteTrainingItem
            )
            .tabItem { Label("TRAINING", systemImage: "figure.run.circle.fill") }
            
            AccountView(
                coach: $coach,
                storedColorScheme: $storedColorScheme
            )
            .tabItem { Label("ACCOUNT", systemImage: "person.crop.circle.fill") }
        }
        .accentColor(.blue)
        .preferredColorScheme(currentSystemColorScheme)
    }
    
    private var currentSystemColorScheme: ColorScheme {
        switch storedColorScheme {
        case .light: return .light
        case .dark: return .dark
        }
    }

    // MARK: - LOGIC FUNCTIONS
    private func addPlayer(_ player: Player) {
        players.append(player)
    }
    
    // THÊM MỚI: Hàm xóa cầu thủ
    private func deletePlayer(at offsets: IndexSet) {
        players.remove(atOffsets: offsets)
    }
    
    private func setFormation(_ formation: Formation) {
        selectedFormation = formation
        playerPositions = MockData.getFormationPositions(for: formation)
    }

    private func saveTrainingItem(_ item: TrainingItem) {
        if let index = trainingItems.firstIndex(where: { $0.id == item.id }) {
            trainingItems[index] = item
        } else {
            trainingItems.append(item)
        }
    }
    
    private func deleteTrainingItem(at offsets: IndexSet) {
        trainingItems.remove(atOffsets: offsets)
    }
}
#Preview {
    ContentView()
}
