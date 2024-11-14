//
//  Info.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//


import MapKit
import CoreLocation
import SwiftData
import SwiftUI


struct AddNewСolleague: View {
    @Environment(\.modelContext) var modelContext
    

    @State private var name = ""
    @State private var phoneNumber = ""
    
    @Binding var photo: Data?
    
    let coordinates: CLLocationCoordinate2D?
    
    var body : some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 44 ) {
                    
                    Image(uiImage: UIImage(data: photo!)!)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300)
                    
                    TextField(" name ", text: $name)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("phone number", text: $phoneNumber )
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Save"){
                        
                        let newCollegue = Collegue(
                            name: name,
                            phone: phoneNumber,
                            photo: photo!,
                            longitude: Double(coordinates?.longitude.description ?? "1"),
                            latitude: Double( coordinates?.latitude.description ?? "1" ))
                        
                        modelContext.insert(newCollegue)
                    }
                    
                    NavigationLink("see All") {
                        ListOfCollegue()
                    }
                    
                    NavigationLink("add another") {
                        ContentView()
                    }
                    
                    Map(){
                        Marker("Collegue", coordinate: coordinates!)
                    }
                    .mapStyle(.hybrid)
                    .frame(width:360, height: 360)
                    
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    AddNewСolleague(photo: )
//}
