//
//  BestSellerView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 12.12.2022.
//

import SwiftUI

struct BestSellerCardView: View {
    @State var sale: BestSeller
    //    @EnvironmentObject var hotSales: ItemsStore
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: sale.picture)) { image in
                    image
                        .resizable()
                        .aspectRatio(
                            contentMode: .fit
                        )
                        .frame(
                            height: 168
                        )
                    
                } placeholder: {
                    Color.black
                }
                .cornerRadius(10)
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
            HStack {
                Text("$" + String(sale.discount_price)).textStyle(color: .defined(.black), size: 16, font: .MarkProBold)
                Text("$" + String(sale.price_without_discount)).textStyle(color:
                        .custom(204, 204, 204), size: 10, font: .MarkProRegular)
            }
            Text(sale.title).textStyle(color: .defined(.black), size: 10, font: .MarkProRegular)
        }
    }
}
struct BestSellerView: View {
    
    @EnvironmentObject var vm: MainPageViewModel
    
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            TitleView(title: "Best sales", buttonText: "see more").padding(EdgeInsets(top: 0, leading: 17, bottom: 8, trailing: 27))
            LazyVGrid(columns: gridItemLayout) {
                ForEach(vm.bestSales) { sale in
                    BestSellerCardView(sale: sale)
                        .onTapGesture {
                            vm.showProduct(sale.id)
                        }
                }.padding()
                    .background(
                        Color(.white)
                    )
                    .cornerRadius(10)
                
                
            }.background(Color.getColor(.custom(248, 248, 248)) ).frame(width: UIScreen.main.bounds.width)
        }
        //            }
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

