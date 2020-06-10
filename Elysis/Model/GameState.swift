//
//  Database.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class GameState {
    
    var gameStateURL: URL
    
    static let shared = GameState()
    
    private init() {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        gameStateURL = documentURL.appendingPathComponent("gameState.json")
        if !FileManager.default.fileExists(atPath: gameStateURL.path) {
            save([])
        }
    }
    
    func save(_ interactions: [Interaction]) {
        do {
            let jsonData = try JSONEncoder().encode(interactions)
            try jsonData.write(to: gameStateURL)
        } catch {
            print("It was not possible to save the game state.")
        }
    }
    
    func load() -> [Interaction] {
        var interactions: [Interaction] = []
        do {
            let jsonData = try Data(contentsOf: gameStateURL)
            interactions = try JSONDecoder().decode([Interaction].self, from: jsonData)
            return interactions
        } catch {
            print("It was not possible to load the game state.")
        }
        return interactions
    }
}
