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
    
    let url: URL
    var body: some View {
        ZStack {
            Rectangle()
                .frame(maxWidth: width, maxHeight: height)
                .foregroundColor(.white)
            AsyncImage(url: url) { image in
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(
                            contentMode: .fill
                        )
                        .frame(
                            maxWidth: width - 10,
                            maxHeight: height - 10)
                        .clipped()
                    //                        .padding(20)
                }
                else {
                    Rectangle()
                        .frame(
                            maxWidth: width - 10,
                            maxHeight: height - 10
                        )
                        .foregroundColor(Color.white)
                }
            }
        placeholder: {
            Rectangle()
                .frame(
                    maxWidth: width - 10,
                    maxHeight: height - 10
                )
                .foregroundColor(Color.white)
        }
        }
        .cornerRadius(20)
        .shadow(radius: 10)
    }
    
}

struct ProductCarouselImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductCarouselImageView(url: URL(string: "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig")!)
    }
}
