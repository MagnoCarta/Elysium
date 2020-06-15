//
//  GameStateTest.swift
//  ElysisTests
//
//  Created by Ronaldo Gomes on 14/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import Cocoa
import XCTest
@testable import Elysis

class GameStateTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testSaveGameStation() {
        let gameStation = GameState()
        let firstInteraction = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let secondInteraction = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactions = [firstInteraction, secondInteraction]
        
        gameStation.save(interactions)
        
        XCTAssertEqual(FileManager.default.fileExists(atPath: gameStation.gameStateURL!.path), true)
        
        let x = FileManager.default.contents(atPath: gameStation.gameStateURL!.path)
        
    }
}
