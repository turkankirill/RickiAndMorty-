//
//  ApiStruct.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 18.03.2021.
//

import Foundation

struct ApiStruct: Decodable {
    let results: [Results]
}
struct Results: Decodable {
    let id: Int
    var name: String
    let status: String
    let origin: Origin
    let image: String?
    
}
struct Origin: Codable {
    let name: String
    let url: String?
}
