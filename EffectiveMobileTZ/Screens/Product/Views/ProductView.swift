//
//  ProductView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import SwiftUI
import ACarousel

struct ProductView: View {
    
    @ObservedObject var vm: ProductViewModel
    
    @State var carouselIndex: Int = 0
    
    @State var tabIndex = 0
    
    @State var capacityIndex: Int = 0
    
    @State var colorIndex: Int = 0
    
    let titles = ["Shop", "Details", "Features"]
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            HStack(spacing: 51) {
                SquaredButton(
                    action: ({
                        print("Back btn pressed")
                        vm.back()
                    }),
                    icon: .back, style: .dark
                )
                Text("Product details")
                    .textStyle(
                        color: .background,
                        size: 18,
                        font: .MarkProMedium
                    )
                SquaredButton(
                    action: { print("Bag btn pressed"); vm.goToCart() },
                    icon: .bag, style: .accent
                )
            }
            
            ACarousel(vm.pictures,
                      id: \.self,
                      index: $carouselIndex,
                      spacing: 0,
                      headspace: 50,
                      sidesScaling: 0.8,
                      isWrap: true,
                      autoScroll: .inactive
            ) { image in
                ProductCarouselImageView(url: image)
               
            }
            Spacer()
            BottomSheetView(content: {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text(vm.product.title)
                                .textStyle(
                                    color: .background,
                                    size: 24,
                                    font: .MarkProMedium
                                )
                            StarRatingView(
                                rating: Int(round(vm.product.rating))
                            )
                        }
                        Spacer()
                        SquaredButton(
                            action: { print("like pressed") },
                            icon: .like, style: .dark
                        )
                    }
                    .padding(
                        EdgeInsets(top: 28, leading: 10, bottom: 0, trailing: 10)
                    )
                    SegmentedControlView(
                        selectedIndex: $tabIndex, titles: titles
                    )
                    .padding(
                        EdgeInsets(top: 0, leading: 0, bottom: 23, trailing: 3)
                    )
                    SpecIconsRowView(device: vm.product)
                        .padding(
                            .bottom, 10
                        )
                    Text("Select color and capacity")
                        .textStyle(
                            color: .background,
                            size: 16,
                            font: .MarkProMedium)
                    Group {
                        HStack {
                            ForEach(vm.colors, id: \.self) { color in
                                ColorSelectionButton(color: color, selectedColor: $vm.selectedColor)
                            }
                            Spacer()
                            ForEach(vm.storageOptions, id: \.self) {value in
                                CapacityButton(value: value, selectedValue: $vm.selectedStorage)
                            }
                            
                        }
                        //                    .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
                        LargeSquaredButtonView(
                            content: {
                                HStack {
                                    Text("Add to cart")
                                        .padding(.leading, 45)
                                    Spacer()
                                    Text("$" + String(vm.product.price))
                                        .padding(.trailing, 38)
                                }
                            },
                            action: {print("Checkout pressed")}
                        )
                    }
                }
                .padding(
                    EdgeInsets(top: 0, leading: 27, bottom: 25, trailing: 27)
                )
            }
            )

        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.getColor(.gray))
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}


struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(vm: ProductViewModel(id: 0))
    }
}
