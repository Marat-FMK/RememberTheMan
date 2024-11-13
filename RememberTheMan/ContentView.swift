//
//  ContentView.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 12.11.2024.
//

import PhotosUI
import SwiftUI

struct ContentView: View {
    
    @State private var selectedPhoto: Data?
    @State private var pickerItem: PhotosPickerItem?
    @State private var image = Image(systemName: "photo")
    
    
    var body: some View {
        NavigationStack {
            VStack {
                if selectedPhoto == nil {
                    
                    NavigationLink("all collegue ") {
                        ListOfCollegue()
                    }
                    
                    PhotosPicker( selection: $pickerItem) {
                        VStack {
                            Image(systemName: "photo.badge.plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 250)
                                .foregroundStyle(.gray)
                            Text("Take photo")
                                .offset(x: -50, y: -60)
                                .foregroundStyle(.white)
                        }
                        .onChange(of: pickerItem) {
                            Task {
                                selectedPhoto = try await  pickerItem?.loadTransferable(type: Data.self)
                                
                            }
                        }
                        .padding()
                    }
                    
                    
                } else {
                    AddNewСolleague(photo: $selectedPhoto )
                }
            }
            .navigationTitle("Rememberer 3000")
        }
    }
}

#Preview {
    ContentView()
}
