//
//  ContentView.swift
//  Newlife
//
//  Created by Giulio Aterno on 02/11/23.
//

import SwiftUI

struct NewsView: View {
    @State private var searchText = ""
    @StateObject var newsModel = NewsModel()
    @State private var isFirstTimeOpened = true
    
    var filteredArticles: [Article] {
        if searchText.isEmpty {
            return newsModel.articles
        } else {
            return newsModel.articles.filter { article in
                return article.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    init() {
    UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).title = "Annulla"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if isFirstTimeOpened {
                    ProgressView()
                        .onAppear {
                            // Esegui la funzione solo se è la prima apertura dell'app
                            newsModel.fetchDataFromAPI()
                            isFirstTimeOpened = false
                        }
                } else {
                    NewsListView()
                }
            }
            .refreshable {
                newsModel.fetchDataFromAPI()
            }
            .navigationBarTitle("News", displayMode: .automatic)
            .searchable(text: $searchText, prompt: "Cerca") {
                ForEach(filteredArticles) { article in
                    Text(article.title)
                }
            }
        }
    }
}

#Preview {
    NewsView()
}

