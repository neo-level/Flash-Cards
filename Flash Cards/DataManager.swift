//
//  DataManager.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import Foundation
import CoreData
import UIKit


class DataManager {
    static let shared = DataManager()
    private init() {}
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var context: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    private var flashcards: [FlashCard] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FlashCard")
        do {
            let result = try context.fetch(fetchRequest) as? [FlashCard]
            return result ?? []
        } catch {
            print("failed to fetch flashcards: \(error)")
            return[]
        }
    }
    
    /**
     Adds a flashcard to the flashcards array.
     - parameters
     - word: the word on the flashcard.
     - answer: the answer for the word.
     */
    func addFlashCard(word: String, answer: String) {
        let flashcard = FlashCard(context: context)
        flashcard.word = word
        flashcard.answer = answer
        flashcard.masteryLevel = 0
        appDelegate.saveContext()
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
