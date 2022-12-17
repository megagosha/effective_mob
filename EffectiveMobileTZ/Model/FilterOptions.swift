//
//  FilterOptions.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 13.12.2022.
//

import Foundation

enum Brand: String {
    case samsung = "Samsung"
    case apple = "Apple"
    case huawei = "Huawei"
}

enum FilterRange {
    case price(from: Int, to: Int)
    case size(from: Float, to: Float)
    
    func get() -> (String, String) {
        switch self {
        case .size(let from, let to):
            return (String(format: "%.1f", from), String(format: "%.1f", to))
        case .price(let from, let to):
            return (String(from), String(to))
        }
    }
}

class FilterSelection {
    var brand: Int
    var price: Int
    var size: Int
    
    init(brand: Int = 0, price: Int = 0, size: Int = 0) {
        self.brand = brand
        self.price = price
        self.size = size
    }
}

struct FilterOptions {
    enum Currencies: String {
        case usd = "$"
        case eur = "€"
    }
    enum Mesurements: String {
        case imperial = "inches"
        case metric = "cm"
    }
    static private let brands: [Brand] = [
        .apple, .huawei, .samsung
    ]
    static private let price_ranges: [FilterRange] = [
        FilterRange.price(from: 500, to: 100),
        FilterRange.price(from: 0, to: 500),
        FilterRange.price(from: 1000, to: 2000)
    ]
    static private let size_ranges: [FilterRange] = [
        FilterRange.size(from: 4.5, to: 5.5),
        FilterRange.size(from: 5.5, to: 6.5),
        FilterRange.size(from: 3.5, to: 4.5)
    ]
    
    
    
    static func getBrands()->[String] {
        return FilterOptions.brands.map { $0.rawValue}
    }
    
    static func getPriceRanges(currency: Currencies)->[String] {
        let sign = currency.rawValue
        return FilterOptions.price_ranges.map { let res = $0.get(); return "\(sign)\(res.0) - \(sign)\(res.1)" }
    }
    
    static func getMesurements(mesure: Mesurements = .imperial)->[String] {
        let sign = mesure.rawValue
        return FilterOptions.size_ranges.map{let res = $0.get(); return "\(res.0) - \(res.1) \(sign)" }
    }
}
