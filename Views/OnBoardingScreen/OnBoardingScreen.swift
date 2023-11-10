//
//  OnBoardingView.swift
//  Newlife
//
//  Created by Giulio Aterno on 10/11/23.
//

import Foundation
import SwiftUI
import Lottie

struct OnBoardingScreen: View {
    @State private var showContentView = false
    @Binding var isOnboardingCompleted: Bool
    @State var onboardingItems: [OnboardingItem] = [
        .init(title: "Saluta Newlife 👋",
              subTitle: "Ciao! Newlife ti permette di ottenere informazioni su come riciclare i prodotti, avere un rifiutologo a portata di mano e tanto altro.",
              lottieView: .init(name: "plantGrowing",bundle: .main)),
        .init(title: "Dove? Come? Quando? 🤯",
              subTitle: "Grazie a Newlife avrai la possibilità di arrivare nei punti di raccolta facilmente. \n\nIl nostro obiettivo è quello di aiutarti fornendoti informazioni sui giorni per la raccolta differenzianta. \n\n Per questo ti consigliamo di attivare le notiiche!",
              lottieView: .init(name: "greenBin",bundle: .main)),
        .init(title: "Scannerizza i prodotti 🔍",
              subTitle: "Scannerizza i tuoi prodotti per ottenere informazioni su come e dove ricicarli. Utilizza la fotocamera per inquadrare il codice a barre del prodotto e riciclalo in maniera corretta!",
              lottieView: .init(name: "scanBarcode",bundle: .main)),
        .init(title: "Un piccolo aiuto. \n Il tuo. 🌱",
              subTitle: "Abbiamo l'obiettivo di aiutarti a modificare le tue abitudini per riciclare in maniera corretta prodotti, cibi e tanto altro. \n\n Aiuta l'ambiente grazie a Newlife!",
              lottieView: .init(name: "handPlant",bundle: .main))
    ]
    @State var currentIndex: Int = 0

    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            HStack(spacing: 0) {
                ForEach($onboardingItems) { $item in
                    let isLastSlide = (currentIndex == onboardingItems.count - 1)
                    VStack {
                        HStack {
                            Button("Indietro") {
                                if currentIndex > 0 {
                                    currentIndex -= 1
                                    playAnimation()
                                }
                            }
                            .opacity(currentIndex > 0 ? 1 : 0)

                            Spacer()

                            Button("Salta") {
                                currentIndex = onboardingItems.count - 1
                                playAnimation()
                            }
                            .opacity(isLastSlide ? 0 : 1)
                        }
                        .animation(.easeInOut, value: currentIndex)
                        .tint(Color("logoColor"))
                        .fontWeight(.bold)

                        VStack(spacing: 15) {
                            let offset = -CGFloat(currentIndex) * size.width
                            ResizableLottieView(onboardingItem: $item)
                                .frame(height: size.width)
                                .onAppear {
                                    if currentIndex == indexOf(item) {
                                        item.lottieView.play(toProgress: 0.7)
                                    }
                                }
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5), value: currentIndex)

                            Text(item.title)
                                .font(.title.bold())
                                .frame(maxWidth: .infinity, alignment: .center)
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)

                            Text(item.subTitle)
                                .font(.system(size: 14))
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 15)
                                .foregroundColor(.gray)
                                .offset(x: offset)
                                .animation(.easeInOut(duration: 0.5).delay(0.2), value: currentIndex)
                        }

                        Spacer()

                        VStack(spacing: 15) {
                            Text(isLastSlide ? "Inizia" : "Avanti")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, isLastSlide ? 13 : 12)
                                .frame(maxWidth: .infinity)
                                .background(
                                    Capsule()
                                        .fill(Color("Green"))
                                )
                                .padding(.horizontal, isLastSlide ? 30 : 100)
                                .onTapGesture {
                                    if currentIndex < onboardingItems.count - 1 {
                                        let currentProgress = onboardingItems[currentIndex].lottieView.currentProgress
                                        onboardingItems[currentIndex].lottieView.currentProgress = (currentProgress == 0 ? 0.7 : currentProgress)
                                        currentIndex += 1
                                        playAnimation()
                                    } else {
                                        showContentView = true
                                        isOnboardingCompleted = true
                                        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
                                    }
                                }
                        }

                        HStack {
                            Text("Copyright (c) 2023 Giulio Aterno")
                                .font(.caption2)
                                .underline(true, color: .primary)
                                .offset(y: 5)
                        }
                    }
                    .animation(.easeInOut, value: isLastSlide)
                    .padding(15)
                    .frame(width: size.width, height: size.height)
                }
            }
            .frame(width: size.width * CGFloat(onboardingItems.count), alignment: .leading)
        }
    }

    func playAnimation() {
        onboardingItems[currentIndex].lottieView.currentProgress = 0
        onboardingItems[currentIndex].lottieView.play(toProgress: 1.0)
    }

    func indexOf(_ item: OnboardingItem) -> Int {
        if let index = onboardingItems.firstIndex(of: item) {
            return index
        }
        return 0
    }
}

struct OnBoardingScreen_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

