//
//  GetMainPageDataRequest.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation

struct GetMainPageDataRequest: APIRequestType {
    typealias Response = MainPageModel
        
    var path: String { return "654bd15e-b121-49ba-a588-960956b15175" }
    var queryItems: [URLQueryItem]? = nil
}
