//
//  FlashCardViewController.swift
//  Flash Cards
//
//  Created by Frederik Desmet on 02/07/2023.
//

import UIKit

class FlashCardViewController: UIViewController {
    @IBOutlet var wordTextField: UITextField!
    @IBOutlet var answerTextField: UITextField!
    @IBOutlet var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    /**
     Creates a flash card when the submit button is clicked.
     */
    @IBAction func createFlashCard(_ sender: UIButton) {
        guard let word = wordTextField.text, !word.isEmpty,
              let answer = answerTextField.text, !answer.isEmpty else { return }
        
        let flashcard = FlashCard(word: word, answer: answer)
        DataManager.shared.addFlashCard(flashcard)
        
        wordTextField.text = ""
        answerTextField.text = ""
    }
}
