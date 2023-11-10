//
//  HomeView.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import SwiftUI

struct HomeView: View {
    @GestureState private var swipeOffset: CGFloat = 0
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.whiteBackground.ignoresSafeArea()
            
            MainTopView()
            
            CentralCardView()
                .padding(.top, 350)
            
            MainBottomView()
        }
        .ignoresSafeArea()
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
