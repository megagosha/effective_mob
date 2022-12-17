//
//  FilterView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct FilterView: View {
    @Binding var currentSelection: FilterSelection
    
    @Binding var isShowing: Bool
    
    let brands = FilterOptions.getBrands()
    
    let prices = FilterOptions.getPriceRanges(currency: .usd)
    
    let sizes = FilterOptions.getMesurements(mesure: .imperial)
    
    public init(currentSelection: Binding<FilterSelection>, isShowing: Binding<Bool>) {
        self._currentSelection = currentSelection
        self._isShowing = isShowing
    }
    
    var body: some View  {
        BottomSheetView(content: {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Button(action: {
                        withAnimation {
                            isShowing.toggle()
                        }
                    }) {
                        Image("Cross")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 10)
                            .foregroundColor(.white)
                            .padding(13)
                    }
                    .background(
                        Color("Background")
                    )
                    .cornerRadius(10)
                    Spacer()
                    Text("Filter options")
                        .textStyle(
                            color: .background,
                            size: 18,
                            font: .MarkProMedium
                        )
                    Spacer()
                    Button(action: {
                        print("Done pressed")
                        // TODO: saveFilterOptions()
                        withAnimation {
                            isShowing.toggle()
                        }
                    }) {
                        Text("Done")
                            .textStyle(
                                color: .defined(.white), size: 18, font: .MarkProMedium
                            ).padding(.bottom, 2)
                        
                    }
                    .frame(width: 86, height: 37)
                    .background(
                        Color("Accent")
                    )
                    .cornerRadius(10)
                }
                .padding(
                    EdgeInsets(top: 24, leading: 0, bottom: 20, trailing: 20)
                )
                OptionPickerView(
                    selected: $currentSelection.brand,
                    name: "Brand",
                    options: brands)
                OptionPickerView(
                    selected: $currentSelection.price,
                    name: "Price",
                    options: prices)
                OptionPickerView(
                    selected: $currentSelection.size,
                    name: "Size",
                    options: sizes)
            }.padding(EdgeInsets(top: 10, leading: 44, bottom: 0, trailing: 20))
        })
    }
}

struct FilterView_Previews: PreviewProvider {

    @State private static var filter = FilterSelection()
    @State private static var isShowing = true
    static var previews: some View {
        FilterView(currentSelection: $filter, isShowing: $isShowing)
    }
}
