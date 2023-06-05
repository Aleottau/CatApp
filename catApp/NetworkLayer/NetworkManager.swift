//
//  NetworkManager.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import Alamofire

protocol NetworkManagerProtocol {
    typealias GetCallback = (Data, CatError?) -> Void
    func get(endPoint: EndPointType, callback: @escaping GetCallback)
}

class NetworkManager {
    private let manager: Alamofire.Session

    init(manager: Alamofire.Session) {
        self.manager = manager
    }
}

extension NetworkManager: NetworkManagerProtocol {
    func get(endPoint: EndPointType, callback: @escaping GetCallback) {
        manager.request(endPoint.requestUrl, method: endPoint.method ,
                        parameters: endPoint.parameters).responseData { afData in
            switch afData.result {
            case .failure: callback(Data(), CatError.noData)
            case .success: callback(afData.data ?? Data(), nil)
            }
        }
    }
}
