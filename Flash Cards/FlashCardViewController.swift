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
    Creates a flash card when the submit button is clicked. stores it into the datamanager array.
    - Returns : nothing when the text values aren't filled in.
     */
    @IBAction func createFlashCard(_ sender: UIButton) {
        guard let word = wordTextField.text, !word.isEmpty,
              let answer = answerTextField.text, !answer.isEmpty else { return }
        
        DataManager.shared.addFlashCard(word: word, answer: answer)
        
        wordTextField.text = ""
        answerTextField.text = ""
    }
}
