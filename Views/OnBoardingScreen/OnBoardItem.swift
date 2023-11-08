//
//  OnBoardItem.swift
//  Newlife
//
//  Created by Giulio Aterno on 08/11/23.
//

import Foundation
import SwiftUI
import Lottie

// MARK: OnBoarding Item Model
struct OnboardingItem: Identifiable,Equatable{
    var id: UUID = .init()
    var title: String
    var subTitle: String
    var lottieView: LottieAnimationView = .init()
}

