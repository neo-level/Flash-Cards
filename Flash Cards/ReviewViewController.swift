//
//  ReviewViewController.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var cardLabel: UILabel!
    @IBOutlet var flipButton: UIButton!
    @IBOutlet var correctButton: UIButton!
    @IBOutlet var wrongflipButton: UIButton!
    
    private var currentFlashCard: FlashCard?
    private var isShowingAnswer = false

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /**
     Begins with the review process.
     */
    @IBAction func startReview(_ sender: UIButton) {
        currentFlashCard = DataManager.shared.getRandomFlashCard()
        guard let flashcard = currentFlashCard else { return }
        
        cardLabel.text = flashcard.word
        isShowingAnswer = false
    }
    
    /**
     Flips the card showing the answer.
     */
    @IBAction func flipCard(_ sender: UIButton) {
        guard let flashcard = currentFlashCard else { return }
        
        cardLabel.text = isShowingAnswer ? flashcard.word : flashcard.answer
        isShowingAnswer.toggle()
    }
    
    @IBAction func answerWasCorrect(_ sender: UIButton ) {
        guard let flashcard = currentFlashCard else { return }
        
        DataManager.shared.updateFlashCardMastery(flashcard, wasCorrect: true)
        startReview(sender)
    }
    
    @IBAction func answerWasWrong(_ sender: UIButton ) {
        guard let flashcard = currentFlashCard else { return }
        
        DataManager.shared.updateFlashCardMastery(flashcard, wasCorrect: false)
        startReview(sender)
    }
    
}
