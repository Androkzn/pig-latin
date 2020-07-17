//
//  Translation.swift
//  pig_latin
//
//  Created by Andrei Tekhtelev on 2020-06-01.
//  Copyright © 2020 HomeDev. All rights reserved.
//

import Foundation

class Translation {
    var counter = 0
    var initialString = "One Two Three"
    var stringAsArray: [String] = []
    var translatedArray: [String] = []
    
    
    
    func breakString (string: String) -> [String]{
        var counter = 0
        stringAsArray = string.components(separatedBy: " ")
        stringAsArray.forEach { stringFromArray in
            if (stringFromArray == " ")  || (stringFromArray == "") {
                stringAsArray.remove(at: counter)
            }
            counter += 1
        }
        return stringAsArray
    }
    
    func translateArray (stringArray: [String]) -> [String]{
        let consonant: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l",
        "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
        let digraphs: [String] = ["ch", "dg", "dg", "gh", "ng", "ph", "sh", "ss", "th","wh"]
        let specialCharacters: [String] = [",", ".", "!", "?", ":", ";"]
        stringAsArray = stringArray
        
        stringAsArray.forEach { stringFromArray in
            let firstCharacter = stringFromArray.first!
            let lastCharacter = stringFromArray.last!
            var isUpercase = false
            var isSpecialCharacterInTheEnd  = false
            let firstLetter =  String(stringFromArray.lowercased().first!)
            let firstTwoLetters = String(stringFromArray.lowercased().prefix(2))
            var stringWithoutSpecialCharacter = stringFromArray
            //Check consonant
            if consonant.contains(stringFromArray.lowercased().first!) {
                //Check upercase
                if firstCharacter.isUppercase {
                    isUpercase = true
                }
                //Check special character
                if specialCharacters.contains(String(lastCharacter)) {
                    isSpecialCharacterInTheEnd = true
                    stringWithoutSpecialCharacter = String(stringWithoutSpecialCharacter.dropLast())
                }
                //Check digraphs
                if digraphs.contains(String(stringFromArray.lowercased().prefix(2))) {
                    let stringWithoutFirstTwoLetter  = (stringWithoutSpecialCharacter.dropFirst()).dropFirst()
                    let newCapitalSting = capitalizeLetter(isCapitalized: isUpercase, string: String(stringWithoutFirstTwoLetter)) + stringWithoutFirstTwoLetter.dropFirst() + firstTwoLetters + "ay" + addSpecialCharacter(isSpecialCharatcterExist: isSpecialCharacterInTheEnd, specialCh: String(lastCharacter))
                        translatedArray  +=   [newCapitalSting]
                } else {
                    let stringWithoutFirstLetter = stringWithoutSpecialCharacter.dropFirst()
                    let newCapitalSting = capitalizeLetter(isCapitalized: isUpercase, string: String(stringWithoutFirstLetter)) + stringWithoutFirstLetter.dropFirst() + String(firstLetter) + "ay" + addSpecialCharacter(isSpecialCharatcterExist: isSpecialCharacterInTheEnd, specialCh: String(lastCharacter))
                    translatedArray  +=   [newCapitalSting]
                }
            } else {
                
                translatedArray  += [stringFromArray]
            }
        }
     return translatedArray
    }
}

func addSpecialCharacter (isSpecialCharatcterExist: Bool, specialCh: String) -> String {
    var specialCharacter: String = ""
    if isSpecialCharatcterExist {
        specialCharacter = specialCh
    }
    return specialCharacter
}

func capitalizeLetter (isCapitalized: Bool, string: String) -> String {
    var capitalizedLetter = String(string.first!)
    if isCapitalized == true{
        capitalizedLetter = String(string.first!.uppercased())
    }
    return capitalizedLetter
}
