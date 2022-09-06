//
//  NetworkService.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation
import Alamofire


class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func createRequest<T : Codable>(router: ApiRouter, onCompletion: @escaping (Result<T,NetworkError>) -> Swift.Void){
        AF.request(router)
            .responseDecodable { (response: DataResponse<T,AFError>) in
                switch response.result {
                case let .success(result):
                    onCompletion(.success(result))
                case let .failure(error):
                    switch response.response?.statusCode {
                    case 401:
                        onCompletion(.failure(.unauthorized))
                    case 404:
                        onCompletion(.failure(.notFound))
                    case 500:
                        onCompletion(.failure(.internalServerError))
                    default:
                        onCompletion(.failure(.customError(error.localizedDescription)))
                    }
                }
            }
    }
}
