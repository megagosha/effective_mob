//
//  TabBarView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 12.12.2022.
//

import SwiftUI
import UIKit
import Stinsen

struct TabBarButton: View {
    
    let item: TabBarItem
    let selectedItem: Bool
    
    
    var body: some View {
        
//        Button(action: {
//        }) {
            HStack(alignment: .center, spacing: 8) {
                if selectedItem {
                    Image("Dot")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 8).padding(.top, 2)
                    Text(item.name).textStyle(color: .defined(.white), size: 15, font: .MarkProBold)
                } else {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                }
            }
//        }
    }
    
}

struct TabBarItem: Identifiable {
    let id: Int
    let name: String
    let image: String
    let goTo: MainPageNavigation?
}
struct TabBarView: View {
    @ObservedObject var vm: MainPageViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .cornerRadius(30)
                .foregroundColor(Color("Background"))
                .padding(.bottom, -30)
            HStack(alignment: .center, spacing: 52) {
                ForEach(vm.tabItems) { item in
                    TabBarButton(item: item, selectedItem: vm.selectedItem == item.name).onTapGesture {
                        withAnimation{
                            print("Pressed")
                            vm.selectedItem = item.name
                            if item.goTo != nil {
                                vm.goToCart()
                            }
                        }
                    }
                }
            }
        }
    }
    
}

struct TabBarView_Previews: PreviewProvider {
    @State private static var vm = MainPageViewModel()
    static var previews: some View {
        TabBarView(vm: vm)
    }
}


