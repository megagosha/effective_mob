//
//  ProductCarouselImage.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct ProductCarouselImageView: View {
    private let height = UIScreen.main.bounds.height / 3
    private let width = UIScreen.main.bounds.width / 1.6
    
    let url: URL?
    var body: some View {
        ZStack {
            Rectangle()
//                .frame(maxWidth: width, maxHeight: height)
                .foregroundColor(.white)
            AsyncImage(url: url) { image in
                if let image = image {
                    image
                        .resizable()
                        .padding(10)
                        .aspectRatio(
                            contentMode: .fit
                        )

                }
                else {
                    Rectangle()
                        .clipped()
                        .foregroundColor(Color.white)
                }
            }
        placeholder: {
            Rectangle()
                .foregroundColor(Color.white)
        }
        }
        .cornerRadius(20)
        .padding()
        .shadow(radius: 10)
    }
    
}

struct ProductCarouselImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductCarouselImageView(url: URL(string: "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig")!)
    }
}
