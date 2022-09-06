//
//  GetTopRatedMovieListsServiceProtocol.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation


protocol GetTopRatedListsServiceProtocol {
    func getTopRated(page: Int, onCompletion: @escaping (Result<[TopRatedMovie],NetworkError>) -> ())
}
