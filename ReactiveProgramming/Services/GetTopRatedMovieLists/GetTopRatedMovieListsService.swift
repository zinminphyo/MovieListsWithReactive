//
//  GetTopRatedMovieListsService.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation
import Alamofire



struct GetTopRatedMovieListsService: GetTopRatedListsServiceProtocol {
    func getTopRated(page: Int, onCompletion: @escaping (Result<[TopRatedMovie], NetworkError>) -> ()) {
        let router = ApiRouter.get_top_rated(page: page)
        NetworkService.shared.createRequest(router: router) { (result: Result<RootObject<TopRatedMovie>,NetworkError>) in
            switch result {
            case .success(let success):
                onCompletion(.success(success.results))
            case .failure(let failure):
                onCompletion(.failure(failure))
            }
        }
    }
}
