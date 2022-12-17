//
//  CartView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI
import Stinsen

struct CartView: View {
    
    @StateObject var vm: CartViewModel
    
    @State var value = 1
    
    let width = UIScreen.main.bounds.width
    
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        VStack(alignment: .leading) {
            Group {
                HStack {
                    SquaredButton(
                        action: {vm.back()},
                        icon: .back,
                        style: .dark
                    )
                    Spacer()
                    Text("Add address")
                        .textStyle(
                            color: .background,
                            size: 15,
                            font: .MarkProMedium)
                    SquaredButton(
                        action: {print("show map")},
                        icon: .map,
                        style: .accent
                    )
                }
                Text("My cart")
                    .textStyle(
                        color: .background,
                        size: 35,
                        font: .MarkProBold
                    )
                    .padding(.bottom, 20)
            }
            .padding(
                EdgeInsets(
                    top: 5, leading: 42, bottom: 0, trailing: 46
                )
            )
            Spacer()
            VStack(spacing: 0) {
                ScrollView(.vertical) {
                    VStack(alignment: .center, spacing: 35) {
                        ForEach(
                            Array(vm.cart.basket.enumerated()),
                            id: \.offset) { index, product in
                                CartProductRowView(
                                    value: $vm.itemCounters[index],
                                    product: product
                                )
                                .environmentObject(vm)
                            }
                        Spacer()
                    }
                    .padding(
                        EdgeInsets(top: 80, leading: 33, bottom: 0, trailing: 32)
                    )
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: UIScreen.main.bounds.height / 1.1
                    )
                    
                }
                HorizontalDivider(
                    color: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25),
                    height: 2
                )
                .padding(.bottom, 15)
                Group {
                    HStack {
                        Text("Total")
                            .textStyle(
                                color: .defined(.white),
                                size: 15,
                                font: .MarkProRegular)
                        Spacer()
                        Text(
                            vm.getTotal()
                        )
                        .textStyle(
                            color: .defined(.white),
                            size: 15,
                            font: .MarkProBold)
                        
                    }
                    HStack {
                        Text("Delivery")
                            .textStyle(
                                color: .defined(.white),
                                size: 15,
                                font: .MarkProRegular
                            )
                        Spacer()
                        Text("Free")
                            .textStyle(
                                color: .defined(.white),
                                size: 15,
                                font: .MarkProBold
                            )
                    }
                    .padding(.bottom, 26)
                }
                .padding(
                    EdgeInsets(top: 15, leading: 55, bottom: 26, trailing: 35)
                )
                .frame(height: 40)
                HorizontalDivider(
                    color: Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.25),
                    height: 1
                )
                LargeSquaredButtonView(content: {
                    Text("Checkout")
                        .textStyle(
                            color: .defined(.white),
                            size: 20,
                            font: .MarkProBold)
                },
                                       action: {print("Checkout")})
            }
            .padding(.bottom, 30)
            .background(
                Color.getColor(.background)
            )
            .cornerRadius(30)
        }
        .background(
            Color(red: 0.96, green: 0.96, blue: 0.96)
        )
        .edgesIgnoringSafeArea(.bottom)
        .padding(.bottom, -25)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}
//
struct CartView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartView(vm: CartViewModel(test: true))
    }
}
