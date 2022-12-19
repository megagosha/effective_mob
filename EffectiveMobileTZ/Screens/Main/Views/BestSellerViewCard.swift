//
//  BestSellerViewCard.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 18.12.2022.
//

import SwiftUI

struct BestSellerCardView: View {
    @State var sale: BestSeller
    //    @EnvironmentObject var hotSales: ItemsStore
    
    var image: some View {
        AsyncImage(url: URL(string: sale.picture)) { image in
            image
                .resizable()
                .aspectRatio(
                    contentMode: .fit
                )
            
        } placeholder: {
            Rectangle()
                .foregroundColor(.white)
        }
        .cornerRadius(10)
    }
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                ZStack(alignment: .topTrailing) {
                    image
                    Button(action: {
                        print("Category  pressed")
                        sale.is_favorites.toggle()
                    }) {
                        Image(sale.is_favorites ? "HeartFilled": "Heart")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 11)
                            .foregroundColor(
                                Color("Accent")
                            )
                            .padding(7)
                    }
                    .background(.white)
                    .clipShape(Circle())
                    .shadow(radius: 20)
                }
                .padding()
                Spacer()
                Group {
                    HStack(alignment: .center) {
                        Text("$" + String(sale.discount_price))
                            .textStyle(
                                color: .defined(.black),
                                size: 16,
                                font: .MarkProBold)
                        Text("$" + String(sale.price_without_discount))
                            .textStyle(
                                color: .custom(204, 204, 204),
                                size: 10,
                                font: .MarkProRegular)
                            .strikethrough()
                    }
                    Text(sale.title)
                        .textStyle(
                            color: .defined(.black),
                            size: 10,
                            font: .MarkProRegular)
                        .padding(.bottom, 15)
                }
                .padding(.leading, 21)
            }
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(radius: 3)
        
    }
}

struct BestSellerViewCard_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerCardView(sale: BestSeller(id: 1, is_favorites: true, title: "Samsung Galaxy s20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"))
    }
}
