//
//  APIError.swift
//  iTunesSearchAPI
//
//  Created by David Simpson on 8/20/22.
//

import Foundation

enum APIError: Error, CustomStringConvertible {
    case badURL
    case urlSession(URLError?)
    case badResponse(Int)
    case decoding(DecodingError?)
    case unknown
    
    var description: String {
        switch self {
        case .badURL:
            return "badURL"
        case .urlSession(let error):
            return "urlSession error: \(error.debugDescription)"
        case .badResponse(let statusCode):
            return "bad response with status code: \(statusCode)"
        case .decoding(let decodingError):
            return "decoding error: \(String(describing: decodingError))"
        case .unknown:
            return "unknown error"
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .badURL, .unknown:
            return "Something went wrong"
        case .urlSession(let urlError):
            return urlError?.localizedDescription ?? "Something went wrong"
        case .badResponse(_):
            return "Something went wrong"
        case .decoding(let decodingError):
            return decodingError?.localizedDescription ?? "Something went wrong"
        }
    }
}
