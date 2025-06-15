//
//  TrainingView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct TrainingView: View {
    @Binding var trainingItems: [TrainingItem]
    let onSaveItem: (TrainingItem) -> Void
    let onDeleteItem: (IndexSet) -> Void

    @State private var showingAddEditSheet = false
    @State private var selectedItemForEdit: TrainingItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(TrainingCategory.allCases) { category in
                    TrainingSectionView(
                        category: category,
                        trainingItems: $trainingItems,
                        onDeleteItem: onDeleteItem
                    )
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("TRAINING")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        selectedItemForEdit = nil
                        showingAddEditSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill").font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showingAddEditSheet) {
                AddEditTrainingView(
                    itemToEdit: selectedItemForEdit,
                    onSave: onSaveItem
                )
            }
        }
    }
}

struct TrainingSectionView: View {
    let category: TrainingCategory
    @Binding var trainingItems: [TrainingItem]
    let onDeleteItem: (IndexSet) -> Void

    private var filteredItems: [TrainingItem] {
        trainingItems.filter { $0.category == category }
    }

    var body: some View {
        Section(header: Text(category.rawValue)) {
            ForEach(filteredItems) { item in
                NavigationLink(destination: TrainingDetailView(item: item)) {
                    Text(item.name)
                }
            }
            .onDelete(perform: delete)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        let itemsToDelete = offsets.map { filteredItems[$0] }
        var originalIndices = IndexSet()
        for item in itemsToDelete {
            if let index = trainingItems.firstIndex(of: item) {
                originalIndices.insert(index)
            }
        }
        if !originalIndices.isEmpty {
            onDeleteItem(originalIndices)
        }
    }
}
