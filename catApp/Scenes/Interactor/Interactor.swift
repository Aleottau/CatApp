//
//  Interactor.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import UIKit

protocol InteractorProtocol {
    func getCatList(callback: @escaping (Result<[CatModel],CatError>) -> Void)
    func getCatImage(referenceId: String, callback: @escaping (Result<UIImage?, CatError>) -> Void)
}

class Interactor {
    let networkManager: NetworkManagerProtocol
    let dataManager: DataManagerProtocol
    private let endPoints: MovieListEndPoint.Type
    
    init(networkManager: NetworkManagerProtocol,dataManager: DataManagerProtocol, endPoints: MovieListEndPoint.Type) {
        self.networkManager = networkManager
        self.dataManager = dataManager
        self.endPoints = endPoints
    }
}
extension Interactor: InteractorProtocol {
    func getCatImage(referenceId: String, callback: @escaping (Result<UIImage?, CatError>) -> Void) {
        networkManager.get(endPoint: endPoints.catImage(referenceId: referenceId)) { [weak self] data, error in
            if let error = error {
                callback(.failure(error))
            } else {
                let catData = self?.dataManager.processDataImage(data: data)
                callback(.success(catData ?? UIImage()))
            }
        }
    }
    
    func getCatList(callback: @escaping (Result<[CatModel], CatError>) -> Void) {
        networkManager.get(endPoint: endPoints.catList) { [weak self] data, error in
            if let error = error {
                callback(.failure(error))
            } else {
                let catData = self?.dataManager.processCatData(data: data)
                callback(.success(catData ?? []))
            }
        }
    }
    

}
