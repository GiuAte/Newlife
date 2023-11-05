//
//  NewsModel.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import Foundation

class NewsModel: ObservableObject {
    @Published var articles: [Article] = []

    func fetchDataFromAPI() {
        let apiKey = "2716ef1404964bfabf6993c15eec2c87"
        let searchTerm = "riciclo"
        let fromDate = "2023-11-03"
        let language = "it"
        let sortBy = "popularity"

        if let url = URL(string: "https://newsapi.org/v2/everything?q=\(searchTerm)&from=\(fromDate)&sortBy=\(sortBy)&language=\(language)&apiKey=\(apiKey)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    // Gestisci l'errore qui, ad esempio aggiornando la UI per mostrare un messaggio di errore
                    return
                }

                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let newsResponse = try decoder.decode(NewsResponse.self, from: data)
                        DispatchQueue.main.async {
                            self.articles = newsResponse.articles
                        }
                    } catch {
                        print("Error decoding data: \(error)")
                        // Gestisci l'errore di decodifica qui, ad esempio aggiornando la UI per mostrare un messaggio di errore
                    }
                }
            }
            task.resume()
        }
    }
}

