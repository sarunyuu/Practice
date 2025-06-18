//
//  CoinAPIError.swift
//  NetworkingTutorial
//
//  Created by Sarunyu Prasert on 15/2/2568 BE.
//

import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFail(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customdescription: String {
        switch self {
        case .invalidData: "Invalid data."
        case .jsonParsingFailure: "Failed to parse JSON."
        case let .requestFail(description): "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): "Invalid status code: \(statusCode)"
        case let .unknownError(error): "Unknown error occuered: \(error.localizedDescription)"
        }
    }
}
