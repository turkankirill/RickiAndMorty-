//
//  ApiStruct.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 18.03.2021.
//

import Foundation


struct ApiStruct: Decodable {
    var info: Info
    var results: [Results]
}
struct Info: Decodable {
    var count: Int
    var pages: Int
    var next: String
    var prev: String?
}
struct Results: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: Location
    var image: String?
    var episode: [String]
    var url: String
    var created: String
}
struct Origin: Decodable {
    var name: String
    var url: String
}
struct Location: Decodable {
    var name: String
    var url: String
}
struct Episode: Decodable {
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
