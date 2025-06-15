//
//  AddEditTrainingView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct AddEditTrainingView: View {
    var itemToEdit: TrainingItem?
    let onSave: (TrainingItem) -> Void
    @Environment(\.dismiss) var dismiss
    
    @State private var name: String = ""
    @State private var category: TrainingCategory = .attack
    @State private var playersNeeded: String = ""
    @State private var time: String = ""
    @State private var description: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                 Section(header: Text("Drill Details")) {
                    TextField("Drill Name", text: $name)
                    Picker("Category", selection: $category) {
                        ForEach(TrainingCategory.allCases) { Text($0.rawValue) }
                    }
                }
                Section(header: Text("Requirements")) {
                    TextField("Players Needed (e.g., 5 + GK)", text: $playersNeeded)
                    TextField("Estimated Time (e.g., 15 mins)", text: $time)
                }
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                        .frame(height: 100)
                }
            }
            .navigationTitle(itemToEdit == nil ? "Add Drill" : "Edit Drill")
            .navigationBarItems(leading: Button("Cancel") { dismiss() },
                                trailing: Button("Save", action: save).disabled(name.isEmpty))
            .onAppear(perform: loadData)
        }
    }

    func loadData() {
        if let item = itemToEdit {
            name = item.name
            category = item.category
            playersNeeded = item.playersNeeded
            time = item.time
            description = item.description
        }
    }

    func save() {
        let itemToSave = TrainingItem(
            id: itemToEdit?.id ?? UUID(),
            name: name,
            category: category,
            playersNeeded: playersNeeded,
            time: time,
            description: description
        )
        onSave(itemToSave)
        dismiss()
    }
}
