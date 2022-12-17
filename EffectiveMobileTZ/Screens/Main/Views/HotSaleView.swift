//
//  HotSaleView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 13.12.2022.
//

import SwiftUI

struct HotSaleView: View {
    var sale: HotSales
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        ZStack(alignment: .trailing) {
            Rectangle()
                .frame(width: width, height: 182)
                .background(.black)
            HStack {
                Spacer()
                AsyncImage(url: sale.picture) { image in
                    if let image = image {
                        image
                            .resizable()
                            .aspectRatio(
                                contentMode: .fit
                            )
                            .frame(
                                maxWidth: width,
                                maxHeight: 182,
                                alignment: .trailing
                            )
                    }
                    else {
                        Rectangle()
                            .frame(
                                width: width,
                                height: 182
                            )
                            .background(Color.black)
                    }
                }
            placeholder: {
                Rectangle()
                    .frame(
                        width: width,
                        height: 182
                    )
                    .background(Color.black)
            }
            }
            Rectangle()
                .frame(width: width, height: 182)
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                        startPoint: .leading, endPoint: .trailing
                    )
                )
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    if sale.is_new == true {
                        Text("New")
                            .textStyle(color: .defined(.white), size: 10, font: .SFProBold)
                            .foregroundColor(.white)
                            .background(
                                Circle()
                                    .fill(
                                        Color("Accent")
                                    )
                                    .frame(width: 27, height: 27)
                            )
                            .padding(.bottom, 18)
                    }
                    Text(sale.title)
                        .textStyle(color: .defined(.white), size: 25, font: .SFProBold)
                        .padding(.bottom, 5)
                    Text(sale.subtitle)
                        .textStyle(color: .defined(.white), size: 11, font: .SFProRegular)
                        .padding(.bottom, 26)
                    Button("Buy now!", action: {
                        print("buy now pressed")
                    })
                    .textStyle(color: .defined(.black), size: 11, font: .SFProBold)
                    .padding(EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 27))
                    .background(.white)
                    .cornerRadius(5)
                }
                Spacer()
            }
            .padding(.leading, 25)
            .padding(.top, 23)
        }
        .cornerRadius(10)
    }
}

struct HotSaleView_Previews: PreviewProvider {
    static var previews: some View {
        HotSaleView(sale: HotSales(
            id: 2,
            title: "Samsung Galaxy A71",
            subtitle: "Súper. Mega. Rápido.",
            picture: URL(string: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg"),
            is_buy: true
        ))
    }
}
