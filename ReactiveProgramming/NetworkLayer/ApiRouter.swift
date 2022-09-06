//
//  ApiRouter.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation
import Alamofire


enum ApiRouter: URLRequestConvertible {
    case get_top_rated(page: Int)
    case get_movie_details(movieId: Int)
    
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL()
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = httpMethod.rawValue
        return try encoding.encode(request, with: parameter)
    }
    
    private var baseURL: String {
        return "https://api.themoviedb.org/3/movie"
    }
    
    private var path: String {
        switch self {
        case .get_top_rated(_):
            return "top_rated"
        case .get_movie_details(_):
            return ""
        }
    }
    
    private var header: HTTPHeaders {
        switch self {
        case .get_top_rated(_):
            return [:]
        case .get_movie_details(_):
            return [:]
        }
    }
    
    private var parameter: Parameters? {
        switch self {
        case .get_top_rated(let page):
            return [
                "api_key" : "33213d9d529e250d99292c1f36c45527",
                "language" : "en-US",
                "page" : page
            ]
        case .get_movie_details(_):
            return [
                "api_key" : "33213d9d529e250d99292c1f36c45527",
                "language" : "en-US"
            ]
        }
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .get_top_rated(_):
            return .get
        case .get_movie_details(_):
            return .get
        }
    }
    
    
    private var encoding: ParameterEncoding {
        switch httpMethod {
        case .get:
            return URLEncoding.default
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
}
