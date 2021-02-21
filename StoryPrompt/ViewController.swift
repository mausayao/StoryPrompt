//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Maurício de Freitas Sayão on 29/01/21.
//

import UIKit

enum TextField: Int {
    case noun, adjective, verb
}

final class ViewController: UIViewController {
    
    @IBOutlet private var textFieldsCollection: [UITextField]!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var numberSlider: UISlider!
    
    let storyPrompt = StoryPromptEntry()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
    }
    
    private func updateStoryPrompt() {
        storyPrompt.noun = textFieldsCollection[TextField.noun.rawValue].text ?? .init()
        
        storyPrompt.adjective = textFieldsCollection[TextField.adjective.rawValue].text ?? .init()
        
        storyPrompt.verb = textFieldsCollection[TextField.verb.rawValue].text ?? .init()
    }

    @IBAction private func generateStoryPrompt(_ sender: UIButton) {
        updateStoryPrompt()
        print(storyPrompt)
    }
    
    @IBAction private func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    
    @IBAction private func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        updateStoryPrompt()
        return true
    }
    
}

