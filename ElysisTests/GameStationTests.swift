//
//  GameStationTests.swift
//  ElysisTests
//
//  Created by Ronaldo Gomes on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import XCTest
@testable import Elysis

class GameStationTests: XCTestCase {
    
    override func tearDown() {
        let gameState = GameState()
        try? FileManager.default.removeItem(at: gameState.gameStateURL)
    }
    
    func mockSave(_ arrayInt: [Int], _ sut: GameState ) {
        
        let jsonData = try? JSONEncoder().encode(arrayInt)
        try? jsonData!.write(to: sut.gameStateURL)
    }

    func test_gameState_createFilePath_true() {
        
        //Given
        let sut = GameState()
        
        //When
        let path = sut.gameStateURL
        
        //Then
        XCTAssertEqual(FileManager.default.fileExists(atPath: path.path), true)
        
    }
    
    func teste_gameState_saveAndLoad_sucess() {
        
        //Given
        let sut = GameState()
        let interactionOne = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        let interactionTwo = Interaction(playerAnswer: "Sad", answerPolarity: .negative)
        let interactionArray = [interactionOne, interactionTwo]
        
        //When
        sut.save(interactionArray)
        let interactions = sut.load()
        let playerAnswerOne = interactions[0].playerAnswer
        let answerPolarityOne = interactions[0].answerPolarity
        let playerAnswerTwo = interactions[1].playerAnswer
        let answerPolarityTwo = interactions[1].answerPolarity
        
        //Then
        XCTAssertEqual(playerAnswerOne, "Happy")
        XCTAssertEqual(answerPolarityOne, Polarity(rawValue: "positive"))
        XCTAssertEqual(playerAnswerTwo, "Sad")
        XCTAssertEqual(answerPolarityTwo, Polarity(rawValue: "negative"))
        
    }
    
    func test_gameState_load_error() {
        
        //Given
        let sut = GameState()
        let interactionWrong = [1,2,4]
        
        //When
        self.mockSave(interactionWrong, sut)
        let interaction = sut.load()
        
        //Then
        XCTAssertNotEqual(interaction.count, interactionWrong.count)
        
    }
}
