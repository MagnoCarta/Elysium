//
//  File.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

struct SaveState {
    var playerAnswers: [String]
    var interactionsCompleted: Int {
        get {
            playerAnswers.count
        }
    }
}
