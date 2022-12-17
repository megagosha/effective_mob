//
//  MainPageView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 16.12.2022.
//

import SwiftUI

struct MainPageView: View {
    @StateObject var vm: MainPageViewModel
    
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
                }
                
            }
            .safeAreaInset(edge: .bottom, content: {
                TabBarView(vm: vm)
            }
            )
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
                ).frame(height: 400)
                    .padding(.bottom, -40)
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
        MainPageView(vm: MainPageViewModel())
    }
}
