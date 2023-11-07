//
//  HomeView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct HomeView: View {
    var daysOfWeek = ["Lunedì", "Martedì", "Mercoledì", "Giovedì", "Venerdì", "Sabato", "Domenica"]
    var dayImages = ["mondayImage", "tuesdayImage", "wednesdayImage", "thursdayImage", "fridayImage", "saturdayImage", "sundayImage"]

    var body: some View {
            ZStack {
                Color("whiteBackground").ignoresSafeArea()
                VStack {
                    // Logo in alto a sinistra
                    Image("NewlifeLogo")
                        .resizable()
                        .padding(.top, 16)
                        .frame(width: .infinity, height: .infinity)
                        .aspectRatio(contentMode: .fit)
                        Spacer()
                }
                
                // Lista orizzontale dei giorni della settimana
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(0..<daysOfWeek.count, id: \.self) { index in
                                ZStack {
                                    Image(dayImages[index])
                                        .resizable()
                                        .frame(width: 180, height: 100)
                                    Text(daysOfWeek[index])
                                }
                                .background(Color.gray)
                                .cornerRadius(10)
                        }
                        .padding(20)
                    }
                }
            }
        }
}

#Preview {
    HomeView()
}
