//
//  RequestError.swift
//  Namaz Vakitleri
//
//  Created by Süha Karakaya on 21.05.2024.
//

import Foundation

public enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case custom(String)
    
    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorized:
            return "Session expired"
        case .custom(let msg):
            return msg
        default:
            return "Unknown error"
        }
    }
}
