//
//  InfoView.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//

import MapKit
import SwiftUI
import SwiftData

struct InfoView: View {
    
    @Query var collegues: [Collegue]
    let collegue: Collegue
    
    var colleguesWithLocation: [Collegue] {
        var test = [Collegue]()
        
        for i in collegues {
            if i.latitude != nil {
                test.append(i)
            }
        }
        return test
    }
    var body: some View {
        VStack{
            Image(uiImage: UIImage(data: collegue.photo)!)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
            
            Text("Name: " + collegue.name)
            
            Text("Phone: " + collegue.phone)
            
            
            if collegue.latitude != nil {
                Map() {
                    Marker("Collegue " + collegue.name, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(collegue.latitude!), longitude: CLLocationDegrees(collegue.longitude!)))
                    
                    ForEach(colleguesWithLocation) { collegue in
                        Annotation("Collegue " + collegue.name, coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(collegue.latitude!), longitude: collegue.longitude!)) {
                            Image(systemName: "star.circle")
                                .resizable()
                                .foregroundStyle(.red)
                                .frame(width:44, height: 44)
                                .background(.white)
                                .clipShape(.circle)
                        }
                        
                    }
                }
                
                Text("Coordinates: " + String(collegue.latitude ?? 0) + "---" + String(collegue.longitude ?? 0) )
            }
        }
    }
}

//#Preview {
//    InfoView()
//}
