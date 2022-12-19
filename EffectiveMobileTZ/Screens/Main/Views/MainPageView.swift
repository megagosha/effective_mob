//
//  MainPageView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI

struct MainPageView: View {
    @ObservedObject var vm: MainPageViewModel
    @ObservedObject var cartVm: CartViewModel
    @State var isFilterOpen: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(.vertical) {
                VStack(alignment: .center, spacing: 35) {
                    LocationHeaderView(filterBtn: $isFilterOpen)
                    CategoryIconSelector()
                    SearchBarView()
                    HotSalesView()
                        .environmentObject(vm)
                    BestSellerView()
                        .environmentObject(vm)
                        .padding(.bottom, 30)
                }
                
            }
            .background(
                Color(
                    red: 248/255,
                    green: 248/255,
                    blue: 248/255
                )
            )
                if isFilterOpen {
                    FilterView(
                        currentSelection: $vm.selectedFilter, isShowing: $isFilterOpen
                    )
                    .frame(height: 400)
                    .padding(.bottom, -40)
                }
                if !isFilterOpen {
                    TabBarView(vm: vm, itemsInCart: $cartVm.itemsInCart)
                }
          
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            vm.selectedItem = vm.tabItems[0].name
        })
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView(vm: MainPageViewModel(), cartVm: CartViewModel())
    }
}
