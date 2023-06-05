//
//  CatError.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation

enum CatError: Error {
case apiError
case invalidEndPoint
case invalidResponse
case noData
case serializationError
var localizedDescription: String {
    switch self {
    case .apiError: return "Failed to fecth data"
    case .invalidEndPoint: return "Invalid endpoint"
    case .invalidResponse: return "Invalid response"
    case .noData: return "No data"
    case .serializationError: return "Failed to decode"
    }
}
}
