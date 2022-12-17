//
//  BestSeller.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 11.12.2022.
//

import Foundation
import SwiftUI

struct BestSeller: Codable, Identifiable {
    let id: Int
    var is_favorites: Bool
    let title: String
    let price_without_discount: Int
    let discount_price: Int
    let picture: String
}
