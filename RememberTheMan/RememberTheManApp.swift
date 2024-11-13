//
//  RememberTheManApp.swift
//  RememberTheMan
//
//  Created by Marat Fakhrizhanov on 12.11.2024.
//

import SwiftUI

@main
struct RememberTheManApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Collegue.self)
    }
}
