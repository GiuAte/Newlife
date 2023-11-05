//
//  BackButton.swift
//  Newlife
//
//  Created by Giulio Aterno on 05/11/23.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var foregroundColor: Color
    
    var body: some View {
        Button(action: { presentationMode.wrappedValue.dismiss()}) {
            HStack {
                
                Image(systemName: "arrow.left")
                    .foregroundColor(foregroundColor)
                    .aspectRatio(contentMode: .fit)
                Text("Indietro")
                    .foregroundColor(foregroundColor)
            }
        }
    }
}
