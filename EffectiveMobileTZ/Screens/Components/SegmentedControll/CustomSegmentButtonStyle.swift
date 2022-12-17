//
//  CustomSegmentButtonStyle.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

internal struct CustomSegmentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(EdgeInsets(top: 12, leading: 15, bottom: 8, trailing: 15))
            .background(configuration.isPressed ? Color("Accent"): Color.clear)
    }
}
