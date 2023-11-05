//
//  SettingsViewModel.swift
//  Newlife
//
//  Created by Giulio Aterno on 04/11/23.
//

import Foundation
import SwiftUI
import MessageUI
import StoreKit


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
