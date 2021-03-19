//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Maurício de Freitas Sayão on 18/03/21.
//

import UIKit

final class StoryPromptViewController: UIViewController {
    
    var storyPrompt: StoryPromptEntry?

    @IBOutlet private weak var storyPromptTextView: UITextView!
    var isNewStoryPrompt: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        storyPromptTextView.text = storyPrompt?.description
        
        if isNewStoryPrompt {
            let saveButton =  UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPromp))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPromp))
            
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
    }
    
    @objc func cancelStoryPromp() {
        performSegue(withIdentifier: "ConcelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPromp() {
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }
    
}
