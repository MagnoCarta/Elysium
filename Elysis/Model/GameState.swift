//
//  Database.swift
//  Elysis
//
//  Created by Rodrigo Matos Aguiar on 10/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Foundation

class GameState {
    
    var gameStateURL: URL?
    
    /// Sets up a GameState object initialized with a URL, according to a filename, to save and load the game state.
    /// - Parameter filename: The name of the file in which the game state will be saved and loaded, without extension.
    init(filename: String = "gameState") {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = url.appendingPathExtension("json")
            self.gameStateURL = fileURL
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                save([])
            }
        } else {
            gameStateURL = nil
        }
    }
    
    /// Saves an array of Interaction objects at the previously initialized URL.
    /// - Parameter interactions: An array of interaction objects which contains all the player answers and their respective API responses.
    func save(_ interactions: [Interaction]) {
        guard let gameStateURL = gameStateURL else {
            print("It was not possible to get the Documents folder.")
            return
        }
        do {
            let jsonData = try JSONEncoder().encode(interactions)
            try jsonData.write(to: gameStateURL)
        } catch {
            print("It was not possible to save the game state.")
        }
    }
    
    /// Loads an array of interaction objects at the previously initialized URL.
    /// - Returns: An array of interaction objects which contains all the player answers and their respective API responses.
    func load() -> [Interaction] {
        var interactions: [Interaction] = []
        guard let gameStateURL = gameStateURL else {
            print("It was not possible to get the Documents folder.")
            return interactions
        }
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
