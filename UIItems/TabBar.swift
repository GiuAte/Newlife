//
//  TabBar.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            // Tab "Home"
            Text("Home")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            // Tab "News"
            Text("News")
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("News")
                }
            
            // Tab "Scan" fuori dalla tab bar
            Text("Scan")
                .tabItem {
                    Image(systemName: "barcode.viewfinder")
                    Text("Scan")
                }

            // Tab "Contatti"
            Text("Contatti")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Contatti")
                }

            // Tab "Impostazioni"
            Text("Impostazioni")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Impostazioni")
                }
        }
    }
}

#Preview {
    TabBar()
}
