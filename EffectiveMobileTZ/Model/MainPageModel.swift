//
//  HomeScreenRequest.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 11.12.2022.
//

import Foundation


struct MainPageModel: Codable {
    let home_store: [HotSales]
    let best_seller: [BestSeller]
}
