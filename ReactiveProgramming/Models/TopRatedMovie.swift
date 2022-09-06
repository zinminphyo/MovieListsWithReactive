//
//  TopRatedMovie.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation

struct TopRatedMovie: Codable {
    let id: Int
    let original_language: String
    let original_title: String
    let overview: String
    let popularity: Double
    let poster_path: String
    let release_date: String
    let title: String
    let vote_average: Double
    let vote_count: Int
    var full_poster_path: String {
        return "https://image.tmdb.org/t/p/original" + poster_path
    }
}
