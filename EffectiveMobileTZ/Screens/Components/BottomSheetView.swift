//
//  BottomSheetFilterView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 13.12.2022.
//

import SwiftUI

struct OptionPickerView: View {
    
    @Binding var selected: Int
    
    let name: String
    
    let options: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .textStyle(
                    color: .background,
                    size: 18,
                    font: .MarkProMedium
                )
            Menu {
                ForEach(0..<options.count){ ix in
                    Button(options[ix]) {
                        selected = ix
                        print("Selected \(options[ix])")
                    }
                }
            } label: {
                VStack(spacing: 5){
                    HStack{
                        Text(
                            options[selected]
                        )
                        .foregroundColor(.black)
                        Spacer()
                        Image("DropdownFilter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 8)
                            .foregroundColor(
                                Color.orange
                            )
                            .font(
                                Font.system(
                                    size: 20,
                                    weight: .bold
                                )
                            )
                    }
                    .padding(
                        EdgeInsets(
                            top: 7, leading: 14, bottom: 7, trailing: 14
                        )
                    )
                    .border(
                        Color.getColor(.custom(220, 220, 220)),
                        width: 1
                    )
                    .cornerRadius(5)
                }
                .padding(
                    .trailing, 31
                )
                .background(
                    Color(.white)
                )
            }
        }
    }
}



struct BottomSheetView<Content: View>:View {
    
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.white
                .ignoresSafeArea()
            self.content
 
        }
        .cornerRadius(16)
        .ignoresSafeArea()
        .background(Color(.white))
        .shadow(radius: 20)
    }
}

struct BottomSheetView_Previews: PreviewProvider {

    static var previews: some View {
        BottomSheetView(content: {
            Text("Test")
        })
    }
}


