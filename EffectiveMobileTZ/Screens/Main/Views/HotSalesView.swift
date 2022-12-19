//
//  HotSalesView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 11.12.2022.
//

import SwiftUI
import ACarousel


struct HotSalesView: View {
    @EnvironmentObject var vm: MainPageViewModel
    
    @State var currentIndex: Int = 0
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TitleView(title: "Hot sales", buttonText: "see more")
                .padding(
                    EdgeInsets(top: 0, leading: 17, bottom: 8, trailing: 17)
                )
            if !vm.isRefreshing {
                ACarousel(vm.hotSales,
                          id: \.self,
                          index: $currentIndex,
                          spacing: 0,
                          headspace: 0,
                          sidesScaling: 0.8,
                          isWrap: true,
                          autoScroll: .active(3)
                ) { sale in
                    HotSaleView(sale: sale, height: height/4.5)
                        .onTapGesture {
                            vm.showProduct(sale.id)
                        }
                }
                .cornerRadius(10)
                .frame(height: height/4.5)
            }
            else {
                Rectangle()
                    .foregroundColor(.white)
                    .frame(
                        width: UIScreen.main.bounds.width,
                        height: height/4.5
                    )
            }
        }
    }
}

enum FontName: String {
    case SFProBold = "SFPro-Bold"
    case SFProRegular = "SFPro-Regular"
    case MarkProBold = "MarkPro-Bold"
    case MarkProHeavy = "MarkPro-Heavy"
    case MarkProMedium = "MarkPro-Medium"
    case MarkProRegular = "MarkPro"
}



extension Color {
    static func getColor(_ color: SColor)->Color {
        switch color {
        case .defined(let c): return c
        case .transparentGray: return Color(red: 0, green: 0,blue: 0, opacity: 0.5)
        case .custom(let int, let int2, let int3):
            return Color(red: int/255, green: int2/255, blue: int3/255)
        case .accent:
            return Color("Accent")
        case .background:
            return Color("Background")
        case .invisible: return Color(red: 0, green: 0, blue: 0, opacity: 0)
        case .gray: return Color(red: 0.96, green: 0.96, blue: 0.96, opacity: 0)
        }
    }
    
    enum SColor {
        case background, accent, transparentGray, invisible, gray
        case defined(Color)
        case custom(Double, Double, Double)
    }
    
    static func hexStringToUIColor (hex: String) -> Color {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return .gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return Color(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            opacity: 1
        )
    }
}

extension View {
    
    
    func textStyle(color: Color.SColor, size: CGFloat, font: FontName) -> some View {
        
        return self
            .font(
                .custom(
                    font.rawValue,
                    size: size)
            )
            .foregroundColor(
                Color.getColor(color)
            )
    }
}
//enum SpecType {
//    case cpu, camera, ram, storage
//}
//
//private func getIcon()->Image {
//    switch type {
//    case .cpu: return Image("CPU")
//    case .camera: return Image("Photo")
//    case .ram: return Image("RAM")
//    case .storage: return Image("Storage")
//    }
//}
let hotSalesExample =  [
    HotSales(id: 1,
             title: "Iphone 12",
             subtitle: "Súper. Mega. Rápido.",
             picture: URL(string: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg?w=1120&h=420&mode=crop&scale=both"),
             is_buy: true,
             is_new: true
            ),
    HotSales(
        id: 2,
        title: "Samsung Galaxy A71",
        subtitle: "Súper. Mega. Rápido.",
        picture: URL(string: "https://cdn-2.tstatic.net/kupang/foto/bank/images/pre-order-samsung-galaxy-a71-laris-manis-inilah-rekomendasi-ponsel-harga-rp-6-jutaan.jpg"),
        is_buy: true
    )]

struct HotSalesView_Previews: PreviewProvider {
    @StateObject static var content = MainPageViewModel()
    static var previews: some View {
        HotSalesView().environmentObject(content)
    }
}


