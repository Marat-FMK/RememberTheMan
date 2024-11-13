//
//  InfoView.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//

import SwiftUI

struct InfoView: View {
    
    let collegue: Collegue
    
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: collegue.photo)!) 
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            
            Text("Name: " + collegue.name)
            
            Text("Phone: " + collegue.phone)
        }
    }
}

//#Preview {
//    InfoView()
//}
