//
//  SearchBarView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 10.12.2022.
//

import SwiftUI

struct SearchBarView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image("Search")
                        .foregroundColor(.secondary)
                        .padding(.leading, 24)
                    TextField("Search", text: $text)
                        .clipShape(Capsule()).padding(.leading, 4.4).frame(height: 34)
                }
                .background(Capsule().fill(Color.white))
                Spacer()
                Button(action: {
                    print("Scan button pressed")
                }) {
                    Image("QR")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15)
                        .foregroundColor(.black)
                }
                .frame(width: 34, height: 34)
                .background(Color("Accent"))
                .clipShape(Circle())

            }
            .background(Capsule().fill(Color(
                red: 248/255,
                green: 248/255,
                blue: 248/255
            )))
        }
        .padding(.leading, 8)
        .padding(.trailing, 19)

    }
    
    
    struct SearchBarView_Previews: PreviewProvider {
        static var previews: some View {
            SearchBarView()
        }
    }
}
