//
//  ContentView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab? = .home
    
    var body: some View {
        TabBarView()
    }
}

#Preview {
    ContentView()
}
