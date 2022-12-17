//
//  StarRatingView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct StarRatingView: View {
    let rating: Int
    
    var body: some View {
        HStack {
            ForEach(0..<rating, id: \.self) { ix in
                Image("Star")
                    .frame(width: 18, height: 18)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: Int(round(4.2)))
    }
}
