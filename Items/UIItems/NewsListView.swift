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
                    VStack(alignment: .center, spacing: 10) {
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
                            .onTapGesture {
                                selectedArticle = article
                            }
                        
                        HStack {
                            Image(systemName: "photo")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fill)
                            
                            
                            Text(article.source.name)
                                .fontWeight(.medium)
                                .foregroundStyle(Color.primary)
                            
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                            
                            Text(article.publishedAt)
                                .fontWeight(.thin)
                                .foregroundStyle(Color.primary)
                        }
                    }
                    .padding()
                }
            }
            
            .onAppear {
                //Fetch data from the API when the view appears
                newsModel.fetchDataFromAPI()
            }
            .sheet(item: $selectedArticle) { article in
                NewsDetailView(article: article) }
        }
    }
}


struct NewsDetailView: View {
    let article: Article
    var body: some View {
        
        Text("Titolo: \(article.title)")
        
    }
}

struct Article: Identifiable, Decodable {
    let id = UUID()
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
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

