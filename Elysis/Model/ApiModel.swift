//
//  ApiModel.swift
//  Elysis
//
//  Created by Kellyane Nogueira on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

struct ResultApi: Codable{
    let polarity: Double
    let type: String
}
struct ApiResponse: Codable{
    let result: ResultApi
}
