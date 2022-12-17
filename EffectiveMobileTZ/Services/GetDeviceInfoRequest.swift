//
//  GetDeviseInfoRequest.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation

struct GetDeviceInfoRequest: APIRequestType {
    typealias Response = Device
        
    var path: String { return "6c14c560-15c6-4248-b9d2-b4508df7d4f5" }
    var queryItems: [URLQueryItem]? = nil
}
