//
//  NewlifeApp.swift
//  Newlife
//
//  Created by Giulio Aterno on 02/11/23.
//

import SwiftUI

@main
struct NewlifeApp: App {
    
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
        }
    }
}

