//
//  TacticsView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct TacticsView: View {
    @Binding var playerPositions: [PlayerPosition]
    @Binding var selectedFormation: Formation
    let onSetFormation: (Formation) -> Void

    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                // 1. Dùng Menu để tạo một nút có thể bung ra danh sách lựa chọn.
                Menu {
                    // 2. Bên trong Menu, ta đặt Picker.
                    //    Picker sẽ tự động tạo ra các lựa chọn và quản lý việc chọn.
                    Picker("Select Formation", selection: $selectedFormation) {
                        ForEach(Formation.allCases) { formation in
                            Text(formation.rawValue).tag(formation)
                        }
                    }
                } label: {
                    // 3. label: là phần tùy biến giao diện cho nút Menu của chúng ta.
                    //    Nó sẽ hiển thị đội hình đang được chọn.
                    HStack {
                        Text("Formation")
                            .font(.headline)
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Text(selectedFormation.rawValue)
                            .fontWeight(.semibold)
                            .foregroundColor(.accentColor)
                        
                        Image(systemName: "chevron.up.chevron.down")
                            .font(.caption.weight(.bold))
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.05), radius: 2, y: 1)
                }
                .padding(.horizontal)

                
                Text(selectedFormation.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)

                GeometryReader { geometry in
                    ZStack {
                        FootballPitchView()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                        
                        ForEach($playerPositions) { $playerPosition in
                            PlayerDotView(playerPosition: $playerPosition, geometry: geometry)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("TACTICS")
            .onChange(of: selectedFormation) { _, newFormation in
                onSetFormation(newFormation)
            }
        }
    }
}
