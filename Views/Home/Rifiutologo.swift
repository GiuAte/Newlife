//
//  Rifiutologo.swift
//  Newlife
//
//  Created by Giulio Aterno on 10/11/23.
//

import SwiftUI

struct Rifiutologo: View {
    
    @State private var searchText = ""
    @State private var filteredItems: [Item] = []
    @Environment(\.presentationMode) var presentationMode
    @State private var isDetailPresented = false
    
    init() {
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).title = "Cancella"
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedItems.keys.sorted(), id: \.self) { key in
                    Section(header: Text(key)) {
                        ForEach(groupedItems[key]!, id: \.id) { item in
                            NavigationLink(destination: DetailView(item: item)) {
                                Text(item.name)
                            }
                        }
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Cerca") {
                ForEach(filteredItems, id: \.id) { item in
                    NavigationLink(destination: DetailView(item: item)) {
                        Text(item.name)
                            .foregroundStyle(Color.primary)
                    }
                    .onTapGesture {
                        searchText = item.name
                    }
                }
            }
            .onChange(of: searchText) { newValue in
                filteredItems = items.filter {
                    $0.name.localizedCaseInsensitiveContains(newValue)
                }
            }
            .navigationBarTitle("Rifiutologo")
            .navigationBarItems(
                leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .imageScale(.large)
                        .foregroundColor(Color.primary)
                })
        }
    }
    
    // Calcola le sezioni basate sulla prima lettera del nome
    private var groupedItems: [String: [Item]] {
        Dictionary(grouping: items) { item in
            String(item.name.prefix(1)).uppercased()
        }
    }
    
    private func filteredItems(in sectionItems: [String]) -> [String] {
        sectionItems.filter {
            searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    private var uniqueLetters: [String] {
        Set(searchText.map { String($0) }).sorted()
    }
}


struct DetailView: View {
    let item: Item
    
    var body: some View {
        VStack {
            Text("Dettagli di \(item.name)")
            Text("Categoria: \(item.category)")
            // Add other details here if necessary
        }
        .navigationBarTitle(item.name)
    }
}

// Extension of Array to group elements
extension Array {
    func groupBy<K: Hashable>(key: (Element) -> K) -> [K: [Element]] {
        var result = [K: [Element]]()
        for element in self {
            let key = key(element)
            if result[key] == nil {
                result[key] = [element]
            } else {
                result[key]?.append(element)
            }
        }
        return result
    }
}

#Preview {
    Rifiutologo()
}
