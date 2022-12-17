//
//  ColorSelectionButton.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct ColorSelectionButton: View {
    
    let color: Color
    
    @Binding var selectedColor: Color
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedColor = color
            }
        }) {
            ZStack {
                Circle()
                    .frame(width: 39.29, height: 39.29)
                if color == selectedColor {
                    Image("Checkmark")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 12.5)
                        .foregroundColor(
                            .red)
                }
            }
        }
        .foregroundColor(color)
    }
}

struct ColorSelectionButton_Previews: PreviewProvider {
    @State private static var selected = Color(.brown)
    static var previews: some View {
        ColorSelectionButton(color: .brown, selectedColor: $selected)
    }
}
