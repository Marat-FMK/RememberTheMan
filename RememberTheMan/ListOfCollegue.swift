//
//  ListOfCollegue.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//

import SwiftUI
import SwiftData

struct ListOfCollegue: View {
    
    @Environment(\.modelContext) var modelcontext
    @Query(sort: \Collegue.name) var collegues: [Collegue]
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
            ForEach(collegues, id: \.self) { collegue in
                NavigationLink {
                    InfoView(collegue: collegue)
                } label: {
                    HStack {
                        Image(uiImage: UIImage(data: collegue.photo)!)
                            .resizable()
                            .frame(width: 30, height: 31)
                            .padding()
                        Spacer()
                        Text(collegue.name)
                            .padding()
                    }
                    .frame(height: 50)
                    
                }
            }
                
            }
            
        }
        
    }

    
}

#Preview {
    ListOfCollegue()
}
