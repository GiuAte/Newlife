//
//  ContentView.swift
//  Newlife
//
//  Created by Giulio Aterno on 02/11/23.
//

import SwiftUI

struct NewsView: View {
    
    var body: some View {
        
        @State var searchText = ""
        
        NavigationView {
            ZStack {
                Color("whiteBackground").ignoresSafeArea()
                    VStack {
                        ForEach(0..<10) { _ in
                            NewsListView()
                        }
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

