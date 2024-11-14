//
//  Collegue.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 13.11.2024.
//

import SwiftData
import SwiftUI

@Model
class Collegue {
    
    var id = UUID()
    var name: String
    var phone: String
    var longitude: Double?
    var latitude: Double?
    @Attribute(.externalStorage) var photo: Data
    
    init(name: String, phone: String, photo: Data, longitude: Double?, latitude: Double?) {
        self.name = name
        self.phone = phone
        self.photo = photo
        self.longitude = longitude
        self.latitude = latitude
    }
}
