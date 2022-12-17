//
//  Device.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation

struct Device: Codable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id: String
    let images: [String]
    let isFavorites: Bool
    let price: Int
    let rating: Float
    let sd: String
    let ssd: String
    let title: String
    
    static func makeEmpty()->Device {
        return Device(CPU: "", camera: "", capacity: [], color: [], id: "", images: [], isFavorites: false, price: 0, rating: 0, sd: "", ssd: "", title: "")
    }
}
