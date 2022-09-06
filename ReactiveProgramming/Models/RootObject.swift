//
//  RootObject.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation


struct RootObject<T:Codable>: Codable {
    let page: Int
    let results: [T]
}
