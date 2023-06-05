//
//  EndPointType.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import Alamofire

protocol EndPointType {
    var baseUrl: URL { get }
    var baseUrlImage: URL { get }
    var path: String { get }
    var method: Alamofire.HTTPMethod { get }
    var requestUrl: URL { get }
    var parameters: [String: Any]? { get }
}

extension EndPointType {
    var baseUrl: URL {
        return URL(string: "https://api.thecatapi.com")!
    }
    var baseUrlImage: URL {
        return URL(string: "https://cdn2.thecatapi.com/images")!
    }
    func dictionaryBase() -> [String: Any] {
        return ["api_key":"bda53789-d59e-46cd-9bc4-2936630fde39"]
    }
}
