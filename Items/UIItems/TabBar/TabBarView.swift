//
//  Home.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import Foundation
import SwiftUI

struct TabBarView: View {
    
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    @AppStorage("isDarkModeEnabled") private var isDarkModeEnabled = false
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
            VStack {
                TabView(selection: $activeTab) {
                    NewsView()
                        .tag(Tab.news)
                    ScanView()
                        .tag(Tab.scan)
                    HomeView()
                        .tag(Tab.home)
                    MapView()
                        .tag(Tab.map)
                    SettingsView()
                        .tag(Tab.settings)
                    
                }
                .overlay(
                    CustomTabBar()
                        .padding(.bottom, 40)
                        .offset(y: UIScreen.main.bounds.height / 2 - 60)
                )
            }
    }
    
    @ViewBuilder
    func CustomTabBar(_ tint: Color = Color("Green"), _ inactiveTint: Color = .gray) -> some View {
        
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midpoint: tabShapePosition.x)
                .fill(Color("whiteBackground"))
                .ignoresSafeArea()
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
                
        })
        .environment(\.colorScheme, isDarkModeEnabled ? .dark : .light)
        /// Adding Animation
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}

/// Tab Bar Item
struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    /// Each Tab Item Position on the Screen
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
            /// Increasing Size for the Active Tab
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.rawValue)
                .font(.caption)
                .foregroundColor(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            /// Updating Active Tab Position
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
