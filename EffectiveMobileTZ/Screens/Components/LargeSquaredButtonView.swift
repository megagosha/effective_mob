//
//  LargeSquaredButtonView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI

struct LargeSquaredButtonView<Content:View>: View {
    let content: Content
    let action: ()->Void
    
    init(@ViewBuilder content: () -> Content, action: @escaping ()->Void) {
        self.content = content()
        self.action = action
    }
    var body: some View {
        Button(action: {self.action()}) {
            content
                .textStyle(color: .defined(.white), size: 20, font: .MarkProBold)
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 54)
                .background(Color.getColor(.accent))
                .cornerRadius(10)
        }
    }
}

struct LargeSquaredButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LargeSquaredButtonView(content: { Text("Place Order")
            .textStyle(color: .defined(.white), size: 20, font: .MarkProBold)}, action: {
                print("Pressed")})
        
    }
}
