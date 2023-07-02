//
//  DataManager.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import Foundation


class DataManager {
    static let shared = DataManager()
    private init() {}
    
    var flashcards: [FlashCard] = []
    
    /**
     Adds a flashcard to the flashcards array.
     - parameters
        - flashcard: The flascard to be added to the collection of flashcards.
     */
    func addFlashCard(_ flashcard: FlashCard) {
        flashcards.append(flashcard)
    }
    
    
    /**
     Gets a random flash card biased by which card is mastered the worst.
     - Returns: a flashcard object
     */
    func getRandomFlashCard() -> FlashCard? {
        guard !flashcards.isEmpty else { return nil }
        let sortedFlashCards = flashcards.sorted(by: {$0.masteryLevel < $1.masteryLevel})
        return sortedFlashCards.first
    }
    
    /**
     Updates the current mastery level. when answered correct or incorrect.
     */
    func updateFlashCardMastery(_ flashcard: FlashCard, wasCorrect: Bool) {
        flashcard.masteryLevel = wasCorrect ? flashcard.masteryLevel + 1 : flashcard.masteryLevel - 1
        flashcard.masteryLevel = max(flashcard.masteryLevel, 0)
    }
}
