//
//  SettingsView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//


import SwiftUI
import MessageUI
import StoreKit

struct SettingsView: View {
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    @State private var isMailViewPresented = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                List {
                    // MARK: - SUPPORTO
                    Section(header: Text("Supporto")) {
                        NavigationLink(destination: LicenseView()) {
                            Image(systemName: "questionmark.circle")
                            Text("Contratto di Licenza")
                        }
                        
                        NavigationLink(destination: TermsAndConditionsView()) {
                            Image(systemName: "shield")
                            Text("Termini e Condizioni")
                        }
                        
                        NavigationLink(destination: PrivacyPolicyView()) {
                            Image(systemName: "hand.raised")
                            Text("Politica sulla Privacy")
                        }
                        
                    }
                    
                    // MARK: - IMPOSTAZIONI
                    
                    Section(header: Text("Impostazioni")) {
                        NavigationLink(destination: Text("Notifiche")) {
                            Image(systemName: "bell")
                            Text("Notifiche")
                        }
                        
                        Toggle("Modalità scura", isOn: $isDarkModeEnabled)
                            .toggleStyle(CustomToggleStyle(isOn: $isDarkModeEnabled))
                        
                        
                        NavigationLink(destination: Text("Widget")) {
                            Image(systemName: "square")
                            Text("Widget")
                        }
                    }
                    
                    // MARK: - NEWLIFE
                    
                    Section(header: Text("Newlife")) {
                        Button(action: {
                            requestAppReview()
                        }) {
                            HStack {
                                Image(systemName: "star")
                                    .foregroundStyle(Color.primary)
                                Text("Valuta l'app")
                                    .foregroundStyle(Color.primary)
                            }
                        }
                        
                        Button(action: {
                            shareApp()
                        }) {
                            HStack {
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundStyle(Color.primary)
                                Text("Condividi questa app")
                                    .foregroundStyle(Color.primary)
                            }
                        }
                        
                        Button(action: {
                            isMailViewPresented.toggle()
                        }) {
                            HStack {
                                Image(systemName: "envelope.open")
                                    .foregroundColor(Color.primary)
                                Text("Contattami")
                                    .accentColor(Color.primary)
                            }
                        }
                        .sheet(isPresented: $isMailViewPresented) {
                            MailComposeView(emailAddress: "giulioaternodev@gmail.com")
                        }
                        
                    }
                    
                    // MARK: - FOOTER
                    
                    Section(footer: Text("Copyright © 2023 Giulio Aterno")) {
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    Section(footer: Text("Newlife 1.0.0")) {
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .underline()
                    
                }
                .background(Color("whiteBackground"))
                .scrollContentBackground(.hidden)
                .listStyle(GroupedListStyle())
                .navigationTitle("Impostazioni")
            }
        }
    }
}

#Preview {
    SettingsView()
}
