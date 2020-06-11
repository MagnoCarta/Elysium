//
//  Interaction.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

// The possible results from the Sentim API
enum Polarity: String, Codable {
    case positive
    case neutral
    case negative
}

// The struct that will represent each interaction the player does.
struct Interaction: Codable {
    let playerAnswer: String
    let answerPolarity: Polarity
}
