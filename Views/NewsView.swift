//
//  ContentView.swift
//  Newlife
//
//  Created by Giulio Aterno on 02/11/23.
//

import SwiftUI

struct NewsView: View {
    
    init() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).title = "Annulla"
    }
    
    var body: some View {
        
        @State var searchText = ""
        
        NavigationView {
            ZStack {
                Color("whiteBackground").ignoresSafeArea()
                    VStack {
                            NewsListView()
                    }
            }
            .navigationBarTitle("News", displayMode: .automatic)
            .searchable(text: $searchText, prompt: "Cerca")
        }
    }
}

#Preview {
    NewsView()
}

