//
//  ElysisTests.swift
//  ElysisTests
//
//  Created by Gilberto Magno on 08/06/20.
//  Copyright © 2020 Gilberto Magno. All rights reserved.
//

import XCTest
@testable import Elysis

class ElysisTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //Verifica se a struct Interaction esta aceitando valores corretamente
    func testInteractionStruct() {
        let interaction = Interaction(playerAnswer: "Happy", answerPolarity: .positive)
        XCTAssertEqual(interaction.playerAnswer, "Happy", "Value of playerAnswer must be Happy")
        XCTAssertEqual(interaction.answerPolarity, Polarity(rawValue: "positive"), "Value of answerPolarity must be positive")
    }
    
    func testGameStateClass() {
        
    }
    
    /*func testApiModel() {
        let api = ApiController()
        api.Submit("Happy")
        

    }*/

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
