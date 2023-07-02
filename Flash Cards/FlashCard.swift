//
//  FlashCard.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import Foundation

class FlashCard {
    var word: String
    var answer: String
    var masteryLevel: Int
    
    init(word: String, answer: String, masteryLevel: Int) {
        self.word = word
        self.answer = answer
        self.masteryLevel = masteryLevel
    }
}
