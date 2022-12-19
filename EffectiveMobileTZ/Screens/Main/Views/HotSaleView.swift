//
//  HotSaleView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 13.12.2022.
//

import SwiftUI

struct HotSaleView: View {
    var sale: HotSales
    let width = UIScreen.main.bounds.width
    let height: CGFloat
    
    var image: some View  {
        return ZStack {
            Rectangle()
                .frame(width: width)
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
                    }
                    else {
                        Rectangle()
                            .background(Color.white)
                    }
                }
            placeholder: {
                Rectangle()
                    .background(Color.black)
            }
            }
            Rectangle()
                .mask(
                    LinearGradient(
                        gradient: Gradient(colors: [.black, .black, .clear, .clear]),
                        startPoint: .leading, endPoint: .trailing
                    )
                )
        }
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            image
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 5) {
                    if sale.is_new == true {
                        ZStack(alignment: .center) {
                            Circle()
                                .foregroundColor(Color.getColor(.accent))
                                .frame(width: 27)
                            Text("New")
                                .textStyle(color: .defined(.white), size: 10, font: .SFProBold)
                        }
                    }
                    else {
                        Circle()//placeholder
                            .foregroundColor(.clear)
                            .frame(width: 27)
                    }
                    Text(sale.title)
                        .textStyle(color: .defined(.white), size: 25, font: .SFProBold)
                        .padding(.bottom, 5)
                    Text(sale.subtitle)
                        .textStyle(color: .defined(.white), size: 11, font: .SFProRegular)
                        .padding(.bottom, 26)
//                    Spacer()
                    Button("Buy now!", action: {
                        print("buy now pressed")
                    })
                    .textStyle(
                        color: .defined(.black),
                        size: 11,
                        font: .SFProBold)
                    .padding(
                        EdgeInsets(top: 5, leading: 25, bottom: 5, trailing: 27))
                    .background(.white)
                    .cornerRadius(5)
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 15, leading: 30, bottom: 0, trailing: 0))
//            .padding(.leading, 40)
        }
        .frame(width: width-30, height: height)
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
            is_buy: true,
            is_new: false
        ), height: UIScreen.main.bounds.height / 4)
    }
}
