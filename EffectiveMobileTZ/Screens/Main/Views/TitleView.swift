//
//  TitleView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 11.12.2022.
//

import SwiftUI

struct TitleView: View {
    let title: String
    let buttonText: String
    
    var body: some View {
        HStack {
            Text(title).font(.custom("MarkPro-Bold", size: 25))
            Spacer()
            Button(action: {
                print("Button pressed")
            }) {
                Text(buttonText)
                    .textStyle(color: .accent, size: 15, font: .MarkProRegular)
            }
        }
        
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: "Select Category", buttonText: "view all")
    }
}
