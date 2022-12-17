//
//  LocationHeaderView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 10.12.2022.
//

import SwiftUI

struct LocationHeaderView: View {
    var location = "Zihuatanejo, Groecccy, Prussia"
    @Binding var filterBtn: Bool
    var body: some View {
        HStack {
            Group {
                Spacer()
                Label(
                    location,
                    image: "MapPin"
                )
                .foregroundColor(
                    Color.getColor(.accent)
                )
                .frame(
                    maxWidth: 300,
                    maxHeight: 19
                )
                .lineLimit(1)
                .font(
                    .custom("MarkPro", size: 15)
                )
                .fixedSize()
                Button {
                } label: {
                    Label("", image: "ArrowDropDown")
                }
                .padding(.bottom, 3)
            }
            Spacer()
            Button {
                withAnimation {
                    filterBtn.toggle()
                }
            } label: {
                Label("", image: "Filter")
            }
        }
        .padding()
    }
}

struct LocationHeaderView_Previews: PreviewProvider {
    @State static var filterBtn = false
    static var previews: some View {
        LocationHeaderView(filterBtn: $filterBtn)
    }
}
