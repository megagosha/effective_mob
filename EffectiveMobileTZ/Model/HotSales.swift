//
//  HotSales.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 11.12.2022.
//

import Foundation

struct HotSales: Codable, Identifiable, Hashable {
    let id: Int
    let is_new: Bool?
    let title: String
    let subtitle: String
    let picture: URL?
    let is_buy: Bool
    
    init(id: Int, title: String, subtitle: String, picture: URL?, is_buy: Bool, is_new: Bool? = nil)
    {
        self.is_new = is_new
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.picture = picture
        self.is_buy = is_buy
    }
    
    static func == (lhs: HotSales, rhs: HotSales) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static let placeholder =  HotSales(
        id: 0, title: "Samsung Galaxy",
        subtitle: "Super Mega Rapdido",
        picture: nil,
        is_buy: true,
        is_new: true
    )
}
