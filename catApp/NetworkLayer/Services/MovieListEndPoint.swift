//
//  MovieListEndPoint.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import Alamofire

enum MovieListEndPoint {
    case catList
    case catImage(referenceId: String)
    var description: String {
        switch self {
        case .catList:
            return "CatList"
        case .catImage(referenceId: _):
            return "CatImage"
        }
    }
}

extension MovieListEndPoint: EndPointType {
    
    var parameters: [String: Any]? {
        switch self {
        case .catList:
            return dictionaryBase()
        case .catImage(referenceId: _):
            return nil
            
        }
    }
        var requestUrl: URL {
            switch self {
            case .catImage(referenceId: _):
                return baseUrlImage.appendingPathComponent(path)
            default:
                return baseUrl.appendingPathComponent(path)
            }
        }
        var path: String {
            switch self {
            case .catList:
                return "/v1/breeds"
            case .catImage(referenceId: let referenceId):
                return "/\(referenceId).jpg"
            }
        }
        var method: Alamofire.HTTPMethod {
            switch self {
            case .catList:
                return .get
            case .catImage(referenceId: _):
                return .get
            }
        }
}
