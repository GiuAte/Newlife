//
//  NewsDetailView.swift
//  Newlife
//
//  Created by Giulio Aterno on 07/11/23.
//

import SwiftUI
import Alamofire
import SwiftSoup

struct NewsDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let article: Article
    @State private var fullArticleText: String = "Caricamento in corso..."
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let imageURL = article.urlToImage, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(6)
                                .shadow(radius: 10)
                        default:
                            ProgressView()
                        }
                    }
                } else {
                    Color.gray.frame(height: 200) // In caso l'immagine sia assente
                }
                
                Text(article.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Text("Data di pubblicazione: \(article.publishedAt)")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Text(fullArticleText)
                    .font(.subheadline)
            }
            .padding()
        }
        .onAppear {
            // Esegui la richiesta HTTP e l'estrazione del testo completo dell'articolo
            fetchMainArticleContent()
        }
    }
    
    private func fetchMainArticleContent() {
        // Effettua una richiesta HTTP per ottenere il contenuto dell'articolo dalla URL
        AF.request(article.url).responseString { response in
            switch response.result {
            case .success(let html):
                do {
                    // Usa SwiftSoup per analizzare l'HTML
                    let doc = try SwiftSoup.parse(html)
                    
                    // Estra l'articolo dal DOM
                    let articleElement = try doc.select("article").first()
                    
                    if let articleText = try articleElement?.text() {
                        fullArticleText = articleText
                    } else {
                        fullArticleText = "Nessun testo disponibile"
                    }
                } catch {
                    print("Errore nell'estrazione del contenuto dell'articolo: \(error)")
                }
            case .failure(let error):
                print("Errore nella richiesta HTTP: \(error)")
                fullArticleText = "Errore nel caricamento del contenuto dell'articolo"
            }
        }
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let mockArticle = Article(
            source: Source(id: nil, name: "News Source"),
            author: "Author",
            title: "Sample Article Title",
            description: "Sample article description.",
            url: "https://www.example.com/sample-article",
            urlToImage: "https://www.example.com/sample-image.jpg",
            publishedAt: "2023-11-07T12:34:56Z",
            content: "This is a sample article content."
        )
        
        NewsDetailView(article: mockArticle)
    }
}
