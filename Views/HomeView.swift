//
//  HomeView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("whiteBackground").ignoresSafeArea()
                VStack {
                    Text("HomeView test")
                }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
