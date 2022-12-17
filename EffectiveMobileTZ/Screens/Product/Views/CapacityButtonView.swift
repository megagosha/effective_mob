//
//  CapacityButton.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

//
//  ColorSelectionButton.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI


struct CapacityButton: View {
    
    let value: String
    
    @Binding var selectedValue: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                selectedValue = value
            }
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(
                        isSelected() ?
                        Color.getColor(.accent) : Color.getColor(.invisible)
                    )
                    .frame(
                        width: 71.3, height: 30.36
                    )
                    
                Text(value)
                    .textStyle(
                        color: isSelected() ? .defined(.white) : .custom(141, 141, 141), size: 13, font: .MarkProBold
                    )
            }
            .cornerRadius(10)
        }
    }
    
    private func isSelected()->Bool {
        return selectedValue == value
    }
}

struct CapacityButton_Previews: PreviewProvider {
    @State private static var selected = "256 GB"
    static var previews: some View {
        CapacityButton(value: "256 GB", selectedValue: $selected)
    }
}

