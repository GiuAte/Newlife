//
//  BasicCardModel.swift
//  Newlife
//
//  Created by Giulio Aterno on 09/11/23.
//

import SwiftUI

protocol BasicCardModelProtocol: Identifiable {
    var title: String { get }
    var subtitle: String { get }
    var description: String { get }
    var color: Color { get }
    var id: Int { get }
    var image: Image { get }
}

struct BasicCardModel: BasicCardModelProtocol {
    var title: String = "Lunedì"
    var subtitle: String = "Scopri cosa riciclare oggi"
    var description: String = "Puoi riciclare il pane e poi anche il cestino asiodsaoiadsioakakosodkkodako kasodkoakdkaosdk aksodkadkokso"
    var id: Int
    var image: Image {  
        return Image(systemName: "photo")
    }
    
    var color: Color {
        return Color.gray.opacity(Double(id) / 10)
    }
    
    static func getExampleModels(count: Int) -> [BasicCardModel] {
        var models: [BasicCardModel] = []
        for i in 1...count {
            models.append(BasicCardModel(id: i))
        }
        return models
    }
}
