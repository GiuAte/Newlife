//
//  HomeView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct HomeView: View {
    @GestureState private var swipeOffset: CGFloat = 0
    var daysOfWeek = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"]
    
    var cards: [BasicCardModel] {
        return daysOfWeek.enumerated().map { BasicCardModel(title: $0.element, id: $0.offset) }
    }
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
            ZStack(alignment: .top) {
                Color.whiteBackground.ignoresSafeArea()
                
                ZStack(alignment: .bottom) {
                    Image("amazonForest")
                        .frame(height: 400)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 200)
                        .ignoresSafeArea()
                        .blur(radius: 1.5)
                    
                    
                    VStack {
                        VStack {
                            HStack {
                                Image("appLogoWhite")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 30)
                                    .padding(.top, 10)
                                
                                Text("Newlife")
                                    .font(.custom(FontsManager.SenkronBlokBold.regular, size: 20))
                                    .foregroundColor(.white)
                            }
                            Text("👋")
                                .font(.title)
                            
                            Text("Ciao!")
                                .font(.custom(FontsManager.SenkronBlokBold.regular, size: 30))
                                .foregroundColor(.white)
                            
                            Text("Inizia a cambiare il mondo. \nRicicla i tuoi prodotti in maniera corretta e fai la raccolta differenziata")
                                .font(.custom(FontsManager.NoyhSlim.semilight, size: 20))
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    .padding(.bottom, 100)
                }
                
                CentralCardView()
                    .padding(.top, 350)
                
                VStack {
                    VStack {
                        HStack {
                            VStack {
                                Text("Rifiutologo")
                                    .font(.custom(FontsManager.SenkronBlokBold.regular, size: 20))
                                    .foregroundColor(Color.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("La raccolta differenziata a portata di app.")
                                    .font(.custom("NoyhSlim-Semilight", size: 15))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 8)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            Button(action: {
                                
                            }) {
                                ZStack {
                                    Rectangle()
                                        .cornerRadius(50)
                                        .foregroundColor(.white)
                                        .frame(width: 80, height: 30)
                                    
                                    Text("Scopri")
                                        .bold()
                                        .font(.custom(FontsManager.SenkronBlokBold.regular, size: 15))
                                        .padding(.bottom, 5)
                                }
                            }
                        }
                        cardContainerView
                            .frame(width: .infinity, height: 180)
                    }
                    .padding()
                }
                .padding(.top, 450)
            }
        .ignoresSafeArea()
    }
    
    private var cardContainerView: some View {
           TabView() {
               ForEach(cards) { model in
                   BasicCardView(model: model)
                       .padding(.horizontal, 10)
               }
           }
           .shadow(radius: 10)
           .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
       }
}

struct BackgroundColorStyle: ViewModifier {
    @Environment (\.colorScheme) var colorScheme:ColorScheme
    func body(content: Content) -> some View {
        if colorScheme == .light {
            return content
                .background(Color("whiteBackground"))
        } else {
            return content
                .background(Color("whiteBackground"))
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
