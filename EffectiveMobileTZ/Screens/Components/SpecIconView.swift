//
//  SpecIconView.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct SpecIconView: View {
    
    let info: String
    let type: SpecType
    
    enum SpecType {
        case cpu, camera, ram, storage
    }
    
    private func getIcon()->Image {
        switch type {
        case .cpu: return Image("CPU")
        case .camera: return Image("Photo")
        case .ram: return Image("RAM")
        case .storage: return Image("Storage")
        }
    }

    var body: some View {
        VStack {
            getIcon()
                .foregroundColor(
                    Color(red: 183/255, green: 183/255, blue: 183/255)
                )
                .frame(width: 28, height: 28)
            Text(info)
                .textStyle(color: .custom(183, 183, 183), size: 11, font: .MarkProRegular)
        }
    }
}


struct SpecIconView_Previews: PreviewProvider {
    static var previews: some View {
        SpecIconView(info: "Exynos 990", type: .storage)
    }
}
