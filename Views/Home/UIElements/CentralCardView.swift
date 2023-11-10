//
//  CentralCardView.swift
//  Newlife
//
//  Created by Giulio Aterno on 09/11/23.
//

import SwiftUI

struct CentralCardView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(10)
                .foregroundColor(Color("logoColor"))
                .frame(width: 300, height: 100)
                .shadow(radius: 10)
            
            HStack {
                Image("appLogoWhite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
                
                VStack(alignment: .leading) {
                    Text("Inizia a riciclare. ♻️")
                        .font(.custom(FontsManager.SenkronBlokBold.regular, size: 20))
                        .foregroundStyle(Color.white)
                    
                    Text("Scopri come fare cliccando qui.")
                        .font(.custom("NoyhSlim-Semilight", size: 20))
                        .foregroundStyle(Color.white)
                        .minimumScaleFactor(0.5)
                }
                
                Image(systemName: "arrow.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
            }
        }
    }
}


#Preview {
    CentralCardView() as any View
}
