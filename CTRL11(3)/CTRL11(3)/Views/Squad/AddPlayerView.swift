//
//  AddPlayerView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct AddPlayerView: View {
    let onSave: (Player) -> Void
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var position = "CM"
    @State private var height = 175
    @State private var weight = 70
    @State private var skills: [String: Int] = [
        "Pace": 3, "Shooting": 3, "Passing": 3,
        "Dribbling": 3, "Defending": 3, "Physical": 3
    ]
    @State private var imageData: Data?
    @State private var showingImagePicker = false
    
    let positions = ["GK", "CB", "LB", "RB", "CDM", "CM", "CAM", "LW", "RW", "ST"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    HStack {
                        Spacer()
                        VStack {
                            if let data = imageData, let uiImage = UIImage(data: data) {
                                Image(uiImage: uiImage)
                                    .resizable().scaledToFill()
                                    .frame(width: 100, height: 100).clipShape(Circle())
                            } else {
                                Image(systemName: "person.crop.circle.badge.plus")
                                    .font(.system(size: 80)).foregroundColor(.gray)
                            }
                            Button("Add Photo") { showingImagePicker = true }
                        }
                        Spacer()
                    }.padding(.vertical)
                }
                
                Section(header: Text("Personal Details")) {
                    TextField("Player Name", text: $name)
                    Picker("Position", selection: $position) {
                        ForEach(positions, id: \.self) { Text($0) }
                    }
                    Stepper("Height: \(height) cm", value: $height, in: 150...210)
                    Stepper("Weight: \(weight) kg", value: $weight, in: 50...110)
                }
                
                Section(header: Text("Skills Rating")) {
                    ForEach(skills.keys.sorted(), id: \.self) { skillKey in
                        HStack {
                            Text(skillKey)
                            Spacer()
                            StarRatingView(rating: Binding(get: { skills[skillKey] ?? 0 }, set: { skills[skillKey] = $0 }))
                        }
                    }
                }
            }
            .navigationTitle("Add New Player")
            .navigationBarItems(leading: Button("Cancel") { dismiss() },
                                trailing: Button("Save") { savePlayer() }.disabled(name.isEmpty))
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(imageData: $imageData)
            }
        }
    }

    func savePlayer() {
        let newPlayer = Player(name: name, position: position, height: height, weight: weight, skills: skills, imageData: imageData)
        onSave(newPlayer)
        dismiss()
    }
}
