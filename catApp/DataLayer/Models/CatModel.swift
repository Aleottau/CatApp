//
//  CatModel.swift
//  catApp
//
//  Created by alejandro on 5/06/23.
//

import Foundation

struct CatModel: Codable, Hashable {
    let id: String
    let name: String
    let origin: String
    let intelligence: Int
    let imageReference: String?
    

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case origin
        case intelligence
        case imageReference = "reference_image_id"
    }
}
