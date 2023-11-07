//
//  NewsModel.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import Foundation
import Combine
import SwiftUI

class NewsModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var filteredArticles: [Article] = []
    @Published var searchText: String = ""
    @Published var selectedArticle: Article?
    @State private var searchIsActive = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Inizializza la ricerca
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] searchText in
                self?.filterArticles()
            }
            .store(in: &cancellables)
        
        fetchDataFromAPI()
    }
    
    func fetchDataFromAPI() {
        let apiKey = "2716ef1404964bfabf6993c15eec2c87"
        let searchTerm = "riciclo"
        let fromDate = "2023-11-03"
        let language = "it"
        let sortBy = "popularity"
        
        if let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchTerm)&from=\(fromDate)&sortBy=\(sortBy)&language=\(language)&apiKey=\(apiKey)") {
            URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: NewsResponse.self, decoder: JSONDecoder())
                .map(\.articles)
                .replaceError(with: [])
                .receive(on: DispatchQueue.main)
                .sink { [weak self] fetchedArticles in
                    // Esegui il codice per estrarre e formattare la data qui
                    let formattedArticles = fetchedArticles.map { article in
                        var formattedArticle = article
                        if let date = self?.formatDate(article.publishedAt) {
                            formattedArticle.publishedAt = date
                        }
                        return formattedArticle
                    }
                    self?.articles = formattedArticles
                }
                .store(in: &cancellables)
        }
    }
    
    func formatDate(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "yyyy/MM/dd"
            return dateFormatter.string(from: date)
        } else {
            return dateString
        }
    }
    
    func filterArticles() {
        if searchText.isEmpty {
            // Se la barra di ricerca è vuota, mostra tutti gli articoli
            Text("Nothing to display")
        } else {
            // Filtra gli articoli in base al testo immesso nella ricerca
            filteredArticles = articles.filter { article in
                return article.title.lowercased().contains(searchText.lowercased())
            }
        }
    }    }
