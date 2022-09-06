//
//  NetworkError.swift
//  ReactiveProgramming
//
//  Created by Zin Min Phyo on 06/09/2022.
//

import Foundation


enum NetworkError {
    case unauthorized
    case notFound
    case internalServerError
    case customError(String)
}


extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .unauthorized:
            return "Unauthorized."
        case .notFound:
            return "Not Found."
        case .internalServerError:
            return "Internal Server Error."
        case .customError(let errorString):
            return errorString
        }
    }
}
