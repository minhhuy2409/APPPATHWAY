//
//  TrainingDetailView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct TrainingDetailView: View {
    let item: TrainingItem

    var body: some View {
        List {
            Section(header: Text("Details")) {
                HStack {
                    Text("Category")
                    Spacer()
                    Text(item.category.rawValue)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Players Needed")
                    Spacer()
                    Text(item.playersNeeded)
                        .foregroundColor(.secondary)
                }
                HStack {
                    Text("Est. Time")
                    Spacer()
                    Text(item.time)
                        .foregroundColor(.secondary)
                }
            }

            Section(header: Text("Description")) {
                Text(item.description)
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
