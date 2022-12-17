//
//  ApiService.swift
//  EffectiveMobileTZ
//
//  Created by George Tevosov on 14.12.2022.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var queryItems: [URLQueryItem]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    
    private let baseURL: URL
    
    init(baseURL: URL = URL(string: "https://run.mocky.io/v3/")!) {
        self.baseURL = baseURL
    }

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIServiceError> where Request: APIRequestType {
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let decorder = JSONDecoder()
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { data, urlResponse in data }
            .mapError { _ in APIServiceError.invalidStatusCode }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError{APIServiceError.custom(error: $0)}
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}


enum APIServiceError: Error {

    case custom(error: Error)
    case failedToDecode
    case invalidStatusCode
    
    var errorDescription: String? {
        switch self {
        case .failedToDecode:
            return "JSON decoder failed to decode response"
        case .invalidStatusCode:
            return "Invalid HTTP code received"
        case .custom(let error):
            return error.localizedDescription
        }
    }
}
