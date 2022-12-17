//
//  ButtonView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI
struct SquaredButton: View {
    enum ButtonStyle {
        case dark, accent
    }
    enum ButtonIcon {
        case back, cross, bag, like, map
    }
    var action: (() -> Void)
    
    var icon: ButtonIcon
    var style: ButtonStyle
    
    var body: some View {
        Button(action: action) {
            makeIcon()
        }
        .background(
            Rectangle()
                .foregroundColor(self.style == .dark ? Color("Background"): Color("Accent"))
                .frame(width: 37, height: 37)
            
        )
        .frame(width: 37, height: 37)
        .cornerRadius(10)
    }
    
    private func styleIcon(icon: Image)-> some View {
        icon.resizable()
            .scaledToFit()
            .frame(maxWidth: 14, maxHeight: 14)
            .padding(7)
            .foregroundColor(.white)
    }
    
    private func makeIcon()-> some View {
        switch icon {
        case .cross: return styleIcon(icon: Image("Cross"))
        case .back:  return styleIcon(icon: Image("Back"))
        case .bag: return styleIcon(icon: Image("Bag"))
        case .like: return styleIcon(icon: Image("HeartTab"))
        case .map: return styleIcon(icon: Image("MapPin"))
        }
    }
}
