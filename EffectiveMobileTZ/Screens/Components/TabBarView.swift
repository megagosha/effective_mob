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
    let digit: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            if selectedItem {
                Image("Dot")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 8).padding(.top, 2)
                    .badge(10)
                Text(item.name).textStyle(color: .defined(.white), size: 15, font: .MarkProBold)
                    .badge(10)
            } else {
                if item.name == "Cart" && digit > 0 {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                        .overlay(
                            NotificationNumLabel(digit: digit)
                        )
                }
                else {
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 18)
                }
            }
        }
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
    @Binding var itemsInCart: Int
    
    var body: some View {
            VStack {
                Spacer()
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .cornerRadius(30)
                        .foregroundColor(Color("Background"))
                        .padding(.bottom, -30)
                    HStack(alignment: .center, spacing: 52) {
                        ForEach(vm.tabItems) { item in
                            TabBarButton(item: item, selectedItem: vm.selectedItem == item.name, digit: itemsInCart)
                                .onTapGesture {
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
            .ignoresSafeArea()
    }
}
//
struct TabBarView_Previews: PreviewProvider {
    @State private static var vm = MainPageViewModel()
    @State private static var count = 9
    static var previews: some View {
        TabBarView(vm: vm, itemsInCart: $count)
    }
}


struct NotificationNumLabel : View {
    var digit : Int
    
    var body: some View {
           return ZStack {
                Capsule()
                    .fill(Color.red)
                    .frame(
                        width: 10 * CGFloat(numOfDigits()),
                        height: 15,
                        alignment: .topTrailing
                    )
                    .position(CGPoint(x: 25, y: 0))
                Text("\(digit)")
                    .foregroundColor(Color.white)
                    .font(
                        Font.system(size: 8)
                            .bold()
                    )
                    .position(CGPoint(x: 25, y: 0))
            }
        }
    
    func numOfDigits() -> Float {
        let numOfDigits = Float(String(digit).count)
        return numOfDigits == 1 ? 1.5 : numOfDigits
    }
}
