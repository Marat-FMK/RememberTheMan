//
//  Info.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//

import SwiftData
import SwiftUI


struct AddNewСolleague: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var name = ""
    @State private var phoneNumber = ""
    
    @Binding var photo: Data?
    
    var body : some View {
        NavigationStack {
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
                    let newCollegue = Collegue(name: name, phone: phoneNumber, photo: photo!)
                    modelContext.insert(newCollegue)
                }
                
                NavigationLink("see All") {
                    ListOfCollegue()
                }
                
                NavigationLink("add another") {
                    ContentView()
                }
            }
            .padding()
        }
    }
}

//#Preview {
//    AddNewСolleague(photo: )
//}
