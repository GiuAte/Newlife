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
            NavigationView {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            .tag(0)
            
            NavigationView {
                NewsView()
            }
            .tabItem {
                Label("News", systemImage: "newspaper")
            }
            .tag(1)
            
            NavigationView {
                ScanView()
            }
            .tabItem {
                Label("Scan", systemImage: "barcode.viewfinder")
            }
            .tag(2)
            
            NavigationView {
                ContactsView()
            }
            .tabItem {
                Label("Contatti", systemImage: "phone")
            }
            .tag(3)
            
            NavigationView {
                SettingsView()
            }
            .tabItem {
                Label("Impostazioni", systemImage: "gearshape")
            }
            .tag(4)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .darkGray
        }
        .toolbarColorScheme(.light, for: .tabBar)
    }
}

#Preview {
    TabBar()
}
