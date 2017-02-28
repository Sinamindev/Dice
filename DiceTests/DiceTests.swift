//
//  DiceTests.swift
//  DiceTests
//
//  Created by Sina on 2/22/17.
//  Copyright © 2017 Sina. All rights reserved.
//

import XCTest
@testable import Dice

class DiceTests: XCTestCase {
    //MARK: Dice Class Tests
    
    // Confirm that the Die initializer returns a Die object when passed valid parameters.
    func testDieInitializationSucceeds() {
        // Zero rating
        let zeroRatingDie = Die.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingDie)
        
        // Highest positive rating
        let positiveRatingDie = Die.init(name: "Positive", photo: nil, rating: 6)
        XCTAssertNotNil(positiveRatingDie)
    }
    
    // Confirm that the Die initialier returns nil when passed a negative rating or an empty name.
    func testDieInitializationFails() {
        // Negative rating
        let negativeRatingDie = Die.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingDie)
        
        // Rating exceeds maximum
        let largeRatingDie = Die.init(name: "Large", photo: nil, rating: 7)
        XCTAssertNil(largeRatingDie)
        
        // Empty String
        let emptyStringDie = Die.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringDie)
    }
}
