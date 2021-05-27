//
//  TransformDataApi.swift
//  tableViewRickiAndMorty
//
//  Created by Turkan Kirill on 17.03.2021.
//

import Foundation

struct TransformDataApi {
    let perId: Int
    let perName: String
    let perStatus: String
    let perOrigin: String
    let imageV: String?
    
    init?(dataApi: DataApi) {
        perId = dataApi.id
        perName = dataApi.name
        perStatus = dataApi.origin.name
    }
}
