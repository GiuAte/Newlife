//
//  MainTopView.swift
//  Newlife
//
//  Created by Giulio Aterno on 10/11/23.
//

import SwiftUI

struct MainTopView: View {
    var body: some View {
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
    }
}

#Preview {
    MainTopView()
}
