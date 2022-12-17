//
//  HorizontalDivider.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI

struct HorizontalDivider: View {
    
    let color: Color
    let height: CGFloat
    
    init(color: Color, height: CGFloat = 0.5) {
        self.color = color
        self.height = height
    }
    
    var body: some View {
        color
            .frame(height: height)
    }
}

struct HorizontalDivider_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalDivider(color: .gray, height: 2)
    }
}
