//
//  EditAccountView.swift
//  CTRL11(3)
//
//  Created by huy bin on 15/6/25.
//

import SwiftUI

struct EditAccountView: View {
    @Binding var coach: Coach
    @Environment(\.dismiss) var dismiss

    @State private var name: String = ""
    @State private var teamName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var favoriteFormation: Formation = .f442
    @State private var experience: String = ""
    @State private var imageData: Data?
    @State private var showingImagePicker = false

    var body: some View {
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
                        Button(imageData == nil ? "Add Photo" : "Change Photo") {
                            showingImagePicker = true
                        }
                    }
                    Spacer()
                }.padding(.vertical)
            }
            
            Section(header: Text("Personal Information")) {
                TextField("Name", text: $name)
                TextField("Team Name", text: $teamName)
                TextField("Email", text: $email).keyboardType(.emailAddress)
                TextField("Phone Number", text: $phoneNumber).keyboardType(.phonePad)
            }
            
            Section(header: Text("Coaching Details")) {
                Picker("Favorite Formation", selection: $favoriteFormation) {
                    ForEach(Formation.allCases) { Text($0.rawValue).tag($0) }
                }
                TextField("Experience", text: $experience)
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarItems(trailing: Button("Save", action: saveChanges).disabled(name.isEmpty || email.isEmpty))
        .onAppear(perform: loadData)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(imageData: $imageData)
        }
    }
    
    func loadData() {
        name = coach.name
        teamName = coach.teamName
        email = coach.email
        phoneNumber = coach.phoneNumber
        favoriteFormation = coach.favoriteFormation
        experience = coach.experience
        imageData = coach.imageData
    }

    func saveChanges() {
        coach.name = name
        coach.teamName = teamName
        coach.email = email
        coach.phoneNumber = phoneNumber
        coach.favoriteFormation = favoriteFormation
        coach.experience = experience
        coach.imageData = imageData
        dismiss()
    }
}
