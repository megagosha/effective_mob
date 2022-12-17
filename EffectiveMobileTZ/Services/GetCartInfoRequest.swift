//
//  GetBasketInfoRequest.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation

struct GetCartInfoRequest: APIRequestType {
    typealias Response = Cart
        
    var path: String { return "53539a72-3c5f-4f30-bbb1-6ca10d42c149" }
    var queryItems: [URLQueryItem]? = nil
}
