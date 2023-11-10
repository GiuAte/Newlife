//
//  MainBottomView.swift
//  Newlife
//
//  Created by Giulio Aterno on 10/11/23.
//

import SwiftUI

struct MainBottomView: View {
    
    @State var isPresented = false
    var daysOfWeek = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"]
    var cards: [BasicCardModel] {
        return daysOfWeek.enumerated().map { BasicCardModel(title: $0.element, id: $0.offset) }
    }
    
    var body: some View {
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
                        isPresented.toggle()
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
                                .fullScreenCover(isPresented: $isPresented, content: Rifiutologo.init)
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

#Preview {
    MainBottomView()
}
