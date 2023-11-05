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
                        NavigationLink(destination: Text("Aiuto")) {
                            Image(systemName: "questionmark.circle")
                            Text("Aiuto")
                        }
                        
                        NavigationLink(destination: Text("Linee Guida")) {
                            Image(systemName: "shield")
                            Text("Linee Guida")
                        }
                        
                        NavigationLink(destination: Text("Politica sulla privacy")) {
                            Image(systemName: "hand.raised")
                            Text("Politica sulla privacy")
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
    
    func shareApp() {
        let text = "Inizia a riciclare i tuoi oggetti! Scarica Newlife"
        if let url = URL(string: "https://www.yourappstorelink.com") {
            let activityViewController = UIActivityViewController(
                activityItems: [text, url],
                applicationActivities: nil
            )
            
            if let viewController = UIApplication.shared.windows.first?.rootViewController {
                viewController.present(activityViewController, animated: true, completion: nil)
            }
        }
    }

    func requestAppReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }

    struct CustomToggleStyle: ToggleStyle {
        @Binding var isOn: Bool
        
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
    
    // MARK: - STRUCT
    
    struct MailComposeView: UIViewControllerRepresentable {
        let emailAddress: String
        
        func makeUIViewController(context: Context) -> MFMailComposeViewController {
            let viewController = MFMailComposeViewController()
            viewController.setToRecipients([emailAddress])
            viewController.setSubject("Contattami")
            viewController.mailComposeDelegate = context.coordinator
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
            var parent: MailComposeView
            
            init(_ parent: MailComposeView) {
                self.parent = parent
            }
            
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                controller.dismiss(animated: true)
            }
        }
    }
}

#Preview {
    SettingsView()
}
