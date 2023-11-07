//
//  NewsListView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct NewsListView: View {
    @StateObject var newsModel = NewsModel()
    @State private var selectedArticle: Article?
    
    var body: some View {
        ZStack {
            Color("whiteBackground").ignoresSafeArea()
            ScrollView {
                ForEach(newsModel.articles) { article in
                    VStack(alignment: .leading, spacing: 10) {
                        if let imageURL = article.urlToImage, let url = URL(string: imageURL) {
                            AsyncImage(url: url) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .frame(width: 364, height: 183)
                                        .aspectRatio(contentMode: .fill)
                                        .cornerRadius(6)
                                        .shadow(radius: 10)
                                default:
                                    ProgressView()
                                }
                            }
                            .onTapGesture {
                                selectedArticle = article
                            }
                        }
                        
                        Text(article.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.primary)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        
                        Text(article.description ?? "")
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .foregroundStyle(Color.primary)
                        
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fill)
                            
                            Text(article.source.name)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.primary)
                            
                            Spacer() // Spazio flessibile per spingere l'orologio verso destra
                            
                            HStack {
                                Image(systemName: "clock")
                                    .foregroundColor(.gray)
                                
                                Text(article.publishedAt)
                                    .fontWeight(.thin)
                                    .foregroundStyle(Color.primary)
                            }
                        }
                    }
                    .padding()
                }
            }
            .sheet(item: $selectedArticle) { article in
                NavigationView {
                    NewsDetailView(article: article)
                        .background(.ultraThinMaterial)
                }
            }
        }
    }
}

struct Article: Identifiable, Decodable {
    var id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    var publishedAt: String
    let content: String?
}

struct Source: Decodable {
    let id: String?
    let name: String
}

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

#Preview {
    NewsListView()
}

