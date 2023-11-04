//
//  SettingsView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import UIKit
import SwiftUI
import StoreKit

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    //                MARK: - SUPPORTO
                    Section(header: Text("Supporto")) {
                        NavigationLink(destination: Text("Aiuto")) {
                            Image(systemName: "questionmark.circle")
                            Text("Aiuto")
                        }
                        NavigationLink(destination: Text("Linee Guida")) {
                            Image(systemName: "shield")
                            Text("Linee Guida")
                        }
                        NavigationLink(destination: Text("Contattami")) {
                            Image(systemName: "envelope.open")
                            Text("Contattami")
                        }
                        NavigationLink(destination: Text("Politica sulla privacy")) {
                            Image(systemName: "hand.raised")
                            Text("Politica sulla privacy")
                        }
                    }
                    
                    //                MARK: - IMPOSTAZIONI
                    
                    Section(header: Text("Impostazioni")) {
                        NavigationLink(destination: Text("Notifiche")) {
                            Image(systemName: "bell")
                            Text("Notifiche")
                        }
                        
                        Toggle("Modalità scura", isOn: $isDarkModeEnabled)
                            .toggleStyle(CustomToggleStyle(configuration: $isDarkModeEnabled))
                        
                        
                        NavigationLink(destination: Text("Widget")) {
                            Image(systemName: "square")
                            Text("Widget")
                        }
                    }
                    
                    //                    MARK: - NEWLIFE
                    
                    Section(header: Text("Newlife")) {
                        Button(action: {
                            requestAppReview()
                        }) {
                            HStack {
                                Image(systemName: "star")
                                Text("Valuta l'app")
                            }
                        }
                        
                        Button(action: {
                            shareApp()
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                Text("Condividi questa app")
                            }
                        }
                    }
                    
                    //                    MARK: - FOOTER
                    
                    Section(footer: Text("Copyright © 2023 Giulio Aterno")) {
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Section(footer: Text("Newlife 1.0.0")) {
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .underline()
                    
                }
                .listStyle(GroupedListStyle())
                .navigationTitle("Impostazioni")
            }
        }
    }
    
    //    MARK: - FUNCTIONS
    func shareApp() {
        let text = "Inizia a riciclare i tuoi oggetti! Scarica Newlife"
        let url = URL(string: "https://www.yourappstorelink.com") // Sostituisci con il link reale dell'app store
        let activityViewController = UIActivityViewController(
            activityItems: [text, url!],
            applicationActivities: nil
        )
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    
    func requestAppReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    struct CustomToggleStyle: ToggleStyle {
        @Binding var isOn: Bool
        
        init(configuration: Binding<Bool>) {
            self._isOn = configuration
        }
        
        func makeBody(configuration: Self.Configuration) -> some View {
            HStack {
                Image(systemName: isOn ? "moon.fill" : "moon")
                    .resizable()
                    .frame(width: 20, height: 20)
                Text("Modalità scura")
                Spacer()
                Toggle("", isOn: $isOn)
                    .labelsHidden()
            }
        }
    }
}


#Preview {
    SettingsView()
}
