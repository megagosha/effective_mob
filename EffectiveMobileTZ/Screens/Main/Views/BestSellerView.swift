//
//  BestSellerView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 12.12.2022.
//

import SwiftUI



struct BestSellerView: View {
    
    @EnvironmentObject var vm: MainPageViewModel
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    let width = (UIScreen.main.bounds.width) / 2
    let height = UIScreen.main.bounds.height / 4.4
    
    var body: some View {
        VStack {
            TitleView(title: "Best sales", buttonText: "see more").padding(EdgeInsets(top: 0, leading: 17, bottom: 8, trailing: 27))
            LazyVGrid(columns: gridItemLayout, spacing: 10) {
                ForEach(vm.bestSales) { sale in
                    BestSellerCardView(sale: sale)
//                        .frame(width: width, height: height)
                        .onTapGesture {
                            vm.showProduct(sale.id)
                        }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 14, bottom: 15, trailing: 14))
        
        }
        .background(
            Color.getColor(.custom(248, 248, 248))
        )
    }
}

var bestSeller = [
    BestSeller(id: 1, is_favorites: true, title: "Samsung Galaxy s20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://shop.gadgetufa.ru/images/upload/52534-smartfon-samsung-galaxy-s20-ultra-12-128-chernyj_1024.jpg"),
    BestSeller(id: 2, is_favorites: false, title: "Samsung Note 20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg")
    ,BestSeller(id: 3, is_favorites: false, title: "Samsung Galaxy s20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://mi92.ru/wp-content/uploads/2020/03/smartfon-xiaomi-mi-10-pro-12-256gb-global-version-starry-blue-sinij-1.jpg"),
    BestSeller(id: 4, is_favorites: true, title: "Samsung Galaxy s20 Ultra", price_without_discount: 1047, discount_price: 10500, picture: "https://www.benchmark.rs/assets/img/news/edge1.jpg")
]
struct BestSellerView_Previews: PreviewProvider {
    @StateObject static var content = MainPageViewModel()
    
    static var previews: some View {
        BestSellerView().environmentObject(content)
    }
}

