//
//  ApiControllerTests.swift
//  ElysisTests
//
//  Created by Ronaldo Gomes on 15/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import XCTest
@testable import Elysis

class ApiControllerTests: XCTestCase {
    
    override func tearDown() {
        let gameState = GameState()
        try? FileManager.default.removeItem(at: gameState.gameStateURL)
    }

    func test_apiController_submitSave_interactions() {
        
        //Given
        let sut = ApiController()
        let expec = expectation(description: "SubmitSave")
        var playerAnswer: String?
        var answerPolarity: Polarity?
        
        //When
        sut.SubmitSave("I am happy") { response in
            answerPolarity = response?.answerPolarity
            playerAnswer = response?.playerAnswer
            
            //Then
            XCTAssertEqual(answerPolarity, Polarity(rawValue: "positive"))
            XCTAssertEqual(playerAnswer, "I am happy")
            expec.fulfill()
        }
        
        wait(for: [expec], timeout: 60)
    }
    
    func test_apiController_submit_apiResponse() {
        
        //Given
        let sut = ApiController()
        let expec = expectation(description: "Submit")
        var resultApiType: String?
        
        //When
        sut.Submit("I am sad") { apiResponse in
            
            resultApiType = apiResponse.result.type
            
            //Then
            XCTAssertEqual(resultApiType, "negative")
            expec.fulfill()
        }
        
        wait(for: [expec], timeout: 60)
    }
}
