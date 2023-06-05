//
//  DataManager.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation
import UIKit

protocol DataManagerProtocol {
    func processCatData(data: Data) -> [CatModel]?
    func processDataImage(data: Data) -> UIImage?
}

class DataManager {
}

extension DataManager: DataManagerProtocol {

    func processDataImage(data: Data) -> UIImage? {
        return UIImage(data: data)
    }

    func processCatData(data: Data) -> [CatModel]? {
        do {
            let dataInfo = try  JSONDecoder().decode(
                [CatModel].self,
                from: data
            )
             print(dataInfo)
            return dataInfo
        } catch let error {
            print("Error: \(error)")
            return nil
        }
    }

}
