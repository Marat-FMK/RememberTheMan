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
    
    @State private var locationFetcher = LocationFetcher()
   
  
    
    var userLocation: CLLocationCoordinate2D? {
        userPosition()
    }
    
    
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
                            
                                locationFetcher.start()
                            
                            Task {
                                selectedPhoto = try await  pickerItem?.loadTransferable(type: Data.self)
                            }
//                            locationFetcher.start()
//                            if let location = locationFetcher.lastKnownLocation {
//                                userLocation = location
//                                print("Your location is \(location)")
//                            } else {
//                                print("Unknown locations")
//                            }
                        }
                        .padding()
                    }
                    
//                    VStack {
//                                Button("Start Tracking Location") {
//                                    locationFetcher.start()
//                                }
//
//                                Button("Read Location") {
//                                    if let location = locationFetcher.lastKnownLocation {
//                                        print("Your location is \(location)")
//                                    } else {
//                                        print("Your location is unknown")
//                                    }
//                                }
//                            }
                    
                    
                } else {
                    AddNewСolleague(photo: $selectedPhoto, coordinates: locationFetcher.lastKnownLocation/* ?? CLLocationCoordinate2D(latitude: CLLocationDegrees(51.501), longitude: CLLocationDegrees(-0.141))*/)
                }
            }
            .navigationTitle("Rememberer 3000")
        }
    }
    
    private func userPosition() -> CLLocationCoordinate2D? {
        let location = locationFetcher.lastKnownLocation
            print("Your location is \(location!)")
            return location
    }
}

#Preview {
    ContentView()
}
