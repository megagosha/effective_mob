//
//  CartProductRowView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI

struct CartProductRowView: View {
    @Binding var value: Int
    @EnvironmentObject var vm: CartViewModel
    
    var product: CartItem
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    init(value: Binding<Int>, product: CartItem) {
        self._value = value
        self.product = product
    }
    var body: some View {
        HStack(alignment: .center) {
            ZStack {
                AsyncImage(url: URL(string: product.images)) { image in
                    if let image = image {
                        image
                            .resizable()
                            .aspectRatio(
                                contentMode: .fit
                            )
                    }
                }
            placeholder: {
                Rectangle()
                    .foregroundColor(.white)
            }
            }.onTapGesture {
                vm.showProduct(0)
            }
            .frame(
                width: height / 9,
                height: height / 9
            )
            .background(.white)
            .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(product.title)
                    .multilineTextAlignment(.leading)
                    .textStyle(
                        color: .defined(.white),
                        size: 20,
                        font: .MarkProMedium
                    )
                Spacer()
                Text("$" + String(product.price) + ".00")
                    .multilineTextAlignment(.leading)
                    .textStyle(
                        color: .accent,
                        size: 20,
                        font: .MarkProMedium
                    )
            }
            Spacer()
            CartStepper(value: $value, in: 0...999)
                .stepperStyle(VerticalStepperStyle())
            Button(action: {print("trash pressed")}) {
                Image("Trash")
            }
            .padding(
                .leading, 10
            )
        }
        .frame(maxHeight: height / 9)    }
}

struct CartProductRowView_Previews: PreviewProvider {
    @State static var val = 0
    static var product = CartItem(id: 1, images: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg", price: 1500, title: "Galaxy Note 20 Ultra")
    static var previews: some View {
        VStack {
            CartProductRowView(value: $val, product: product)
                .border(.red)
        }.padding(EdgeInsets(top: 100, leading: 35, bottom: 100, trailing: 35))
        .background(Color.getColor(.background))
    }
}
