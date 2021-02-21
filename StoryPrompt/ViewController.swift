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

class ViewController: UIViewController {
    
    @IBOutlet var textFieldsCollection: [UITextField]!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var numberSlider: UISlider!
    
    let storyPrompt = StoryPromptEntry()

    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
       
    }

    @IBAction func changeNumber(_ sender: UISlider) {
        numberLabel.text = "Number: \(Int(sender.value))"
        storyPrompt.number = Int(sender.value)
    }
    
    @IBAction func changeStoryType(_ sender: UISegmentedControl) {
        if let genre = StoryPrompts.Genre(rawValue: sender.selectedSegmentIndex) {
            storyPrompt.genre = genre
        } else {
            storyPrompt.genre = .scifi
        }
        
        print(storyPrompt.genre)
    }
}

