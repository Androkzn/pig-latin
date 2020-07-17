//
//  ViewControllerTest.swift
//  pig_latinTests
//
//  Created by Andrei Tekhtelev on 2020-06-01.
//  Copyright © 2020 HomeDev. All rights reserved.
//

import XCTest
@testable import pig_latin

class ViewControllerTest: XCTestCase {

    var viewController: ViewController!
    
    override func setUp () {
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? ViewController
        _ = viewController.view
    }
    
    func testUpdatesTranslationLabel () {
        let textField = viewController.textField!
        textField.text = "One Two Three"
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        XCTAssertEqual(viewController.translationTextView.text, "One Wotay Reethay")
        textField.text = "four six Eight"
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        XCTAssertEqual(viewController.translationTextView.text, "ourfay ixsay Eight")
        textField.text = ""
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        XCTAssertEqual(viewController.translationTextView.text, "")
    }
    
    func testCleansTextFieldWhenTranslationIsDone () {
        let textField = viewController.textField!
        textField.text = "Hello"
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        XCTAssertEqual(viewController.textField.text, "")
    }
    
    func testUpdatesPigsLabels () {
        let textField = viewController.textField!
        textField.text = "One Two Three!"
        _ = textField.delegate?.textFieldShouldReturn?(textField)
        XCTAssertEqual(viewController.firstPigLabel.text, "One Two Three!")
        XCTAssertEqual(viewController.secondPigLabel.text, "One Wotay Reethay!")
    }
    
}
