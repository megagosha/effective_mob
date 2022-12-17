//
//  BasketItem.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation

struct CartItem: Codable, Hashable {
    let id: Int
    let images: String
    let price: Int
    let title: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
    
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        return lhs.id == rhs.id
    }
}
