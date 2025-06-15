//
//  AccountView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct AccountView: View {
    @Binding var coach: Coach
    @Binding var storedColorScheme: StoredColorScheme
    @State private var showCopiedMessage = false

    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack(spacing: 20) {
                        coach.coachImage
                            .resizable().scaledToFill()
                            .frame(width: 80, height: 80).clipShape(Circle())
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(coach.name).font(.title2.weight(.bold))
                            Text(coach.teamName).font(.subheadline).foregroundColor(.secondary)
                            Button(action: copyEmail) {
                                Label(coach.email, systemImage: "doc.on.doc")
                            }
                            .tint(.blue).buttonStyle(.borderless)
                        }
                    }
                    .padding(.vertical, 10)
                }

                Section(header: Text("Coach Details")) {
                    Label(coach.phoneNumber, systemImage: "phone.fill")
                    Label(coach.favoriteFormation.rawValue, systemImage: "sportscourt.fill")
                    Label(coach.experience, systemImage: "star.fill")
                }

                Section(header: Text("Settings")) {
                    NavigationLink(destination: EditAccountView(coach: $coach)) {
                        Label("Edit Profile", systemImage: "pencil")
                    }
                    
                    Toggle(isOn: Binding(
                        get: { storedColorScheme == .dark },
                        set: { isDark in storedColorScheme = isDark ? .dark : .light }
                    )) { Label("Dark Mode", systemImage: "moon.fill") }
                }
                
                Section {
                    Button(role: .destructive, action: {}) {
                        Label("Log Out", systemImage: "arrow.backward.circle.fill")
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("ACCOUNT")
        }
    }

    func copyEmail() {
        UIPasteboard.general.string = coach.email
        // ... (phần hiện thông báo không đổi)
    }
}
