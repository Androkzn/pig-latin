//
//  TranslationTest.swift
//  pig_latinTests
//
//  Created by Andrei Tekhtelev on 2020-05-31.
//  Copyright © 2020 HomeDev. All rights reserved.
//

import XCTest
@testable import pig_latin
 

class TranslationTest: XCTestCase {
    let translation = Translation()
    
    
    func testBreakStringToProperNumberOfWords () {
        XCTAssertEqual(translation.breakString(string: "One").count, 1)
        XCTAssertEqual(translation.breakString(string: "One ").count, 1)
        XCTAssertEqual(translation.breakString(string: "One Two ").count, 2)
        XCTAssertEqual(translation.breakString(string: "One Two Three").count, 3)
        XCTAssertEqual(translation.breakString(string: "One, Two, Three").count, 3)
    }
    
    func testBreakingStringKeepsComas() {
        XCTAssertEqual(translation.breakString(string: "One").joined(separator: " "), "One")
        XCTAssertEqual(translation.breakString(string: "One, ").joined(separator: " "), "One,")
        XCTAssertEqual(translation.breakString(string: "One, Two").joined(separator: " "), "One, Two")
        XCTAssertEqual(translation.breakString(string: "One, Two, Three").joined(separator: " "), "One, Two, Three")
    }
    
    func testTranslationCorrectSimpleConsonant () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "four")).joined(separator: " "), "ourfay")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "five six")).joined(separator: " "), "ivefay ixsay")
    }
    
    func testTranslationCorrectVovel () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "one")).joined(separator: " "), "one")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "one eight")).joined(separator: " "), "one eight")
    }
    
    
    func testTranslationCorrectCapitalizeSimpleConsonant () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "One")).joined(separator: " "), "One")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "one Eight")).joined(separator: " "), "one Eight")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "One eight")).joined(separator: " "), "One eight")
        
    }
    
    func testTranslationCorrectMix () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "one two")).joined(separator: " "), "one wotay")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "two one")).joined(separator: " "), "wotay one")
    }
    
    
    func testTranslationCorrectCapitalizeVovel () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Four")).joined(separator: " "), "Ourfay")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Five six")).joined(separator: " "), "Ivefay ixsay")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Four Five")).joined(separator: " "), "Ourfay Ivefay")
        
    }
    
    func testTranslationCorrectConsonantDigraph  () {
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "three")).joined(separator: " "), "reethay")
        translation.translatedArray.removeAll()
        XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "thirty three")).joined(separator: " "), "irtythay reethay")
  
    }
    
      func testTranslationCorrectCapitalizeConsonantDigraph  () {
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Three")).joined(separator: " "), "Reethay")
          translation.translatedArray.removeAll()
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Thirty three")).joined(separator: " "), "Irtythay reethay")
          translation.translatedArray.removeAll()
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Thirty Three")).joined(separator: " "), "Irtythay Reethay")
    
      }
    
      func testTranslationCorrectWithSpecialCharacters  () {
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Three?")).joined(separator: " "), "Reethay?")
          translation.translatedArray.removeAll()
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Thirty,  three")).joined(separator: " "), "Irtythay, reethay")
          translation.translatedArray.removeAll()
          XCTAssertEqual(translation.translateArray(stringArray: translation.breakString(string: "Thirty: Three!")).joined(separator: " "), "Irtythay: Reethay!")
    
      }
    
    
    

}
