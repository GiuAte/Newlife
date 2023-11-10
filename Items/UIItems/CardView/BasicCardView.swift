//
//  BasicCardView.swift
//  Newlife
//
//  Created by Giulio Aterno on 09/11/23.
//

import SwiftUI

struct BasicCardView: View {
    //MARK: Model
    var model: any BasicCardModelProtocol
    
    //MARK: UI
    enum UI {
        static let defaultOffset: CGFloat = 10
        static let largerOffset: CGFloat = 20
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.green)
                
            VStack(alignment: .leading, spacing: -20) {
                Text(model.title)
                    .font(.custom(FontsManager.SenkronBlokBold.regular, size: 30))
                    .padding(.leading, 10)
                
                Text(model.description)
                    .font(.custom(FontsManager.NoyhSlim.semilight, size: 20))
                    .padding(20)
                    .padding(.leading, -10)

            }
        }
        .frame(width: .infinity, height: .infinity)
    }

    
    private func section(_ text: String) -> some View {
        let stack = VStack {
            HStack {
                Text("Section: ")
                    .font(.subheadline)
                    .foregroundColor(Color.gray.opacity(0.8))
                    .padding([.vertical], -10)
                Spacer()
            }
            
            Text(text)
                .font(.title2)
                .padding(.bottom, UI.defaultOffset)
        }
        return stack
    }
}

struct BasicCardView_Previews: PreviewProvider {
    static var previews: some View {
        BasicCardView(model: BasicCardModel(id: 0))
    }
}
