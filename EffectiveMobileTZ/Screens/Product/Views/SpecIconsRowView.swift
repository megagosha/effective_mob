//
//  SpecIconsRow.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 15.12.2022.
//

import SwiftUI

struct SpecIconsRowView: View {
    var device: Device
    
    var body: some View {
        
        HStack {
            SpecIconView(info: device.CPU, type: .cpu)
            Spacer()
            SpecIconView(info: device.camera, type: .camera)
            Spacer()
            SpecIconView(info: device.sd, type: .ram)
            Spacer()
            SpecIconView(info: device.sd, type: .storage)
        }
    }
}

struct SpecIconsRowView_Previews: PreviewProvider {
    
    private static var device = Device(CPU: "Exynos 990", camera: "108 + 12 mp", capacity: [""], color: [], id: "", images: [], isFavorites: false, price: 0, rating: 0, sd: "256 GB", ssd: "8GB", title: "")
    static var previews: some View {
        SpecIconsRowView(device: device)
    }
}
