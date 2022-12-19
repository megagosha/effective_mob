//
//  Basket.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation


struct Cart: Codable {
    var basket: [CartItem]
    let delivery: String
    let id: String
    let total: Int
}
