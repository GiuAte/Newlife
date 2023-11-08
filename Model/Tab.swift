//
//  Tab.swift
//  Newlife
//
//  Created by Giulio Aterno on 03/11/23.
//

import Foundation
import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case news = "News"
    case scan = "Scan"
    case home = "Home"
    case map = "Mappa"
    case settings = "Impostazioni"
    
    var systemImage: String {
        switch self {
        case .scan:
            return "barcode.viewfinder"
        case .news:
            return "newspaper"
        case .home:
            return "house"
        case .map:
            return "map"
        case .settings:
            return "gearshape"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}

