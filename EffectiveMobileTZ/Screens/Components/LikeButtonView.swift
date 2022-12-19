////
////  LikeButtonView.swift
////  EffectiveMobileTZ
////
////  Created by George Tevosov on 18.12.2022.
////
//
//import SwiftUI
//
//struct LikeButtonView: View {
//    @Binding var likedProduct: BestSeller
//    
//    var body: some View {
//        Button(action: {
//            print("Like button  pressed")
//            likedProduct.is_favorites.toggle()
//        }) {
//            Image(likedProduct.is_favorites ? "HeartFilled": "Heart")
//                .resizable()
//                .scaledToFit()
//                .frame(maxHeight: 11)
//                .foregroundColor(
//                    Color("Accent")
//                )
//                .padding(7)
//        }
//        .background(.white)
//        .clipShape(Circle())
//        .shadow(radius: 20)
//    }
//}
//
//struct LikeButtonView_Previews: PreviewProvider {
//    @State private static var bestProduct = BestSeller(id: 1, is_favorites: true, title: "Samsung Galaxy s20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg")
//    static var previews: some View {
//        LikeButtonView(likedProduct: $bestProduct)
//    }
//}
//
