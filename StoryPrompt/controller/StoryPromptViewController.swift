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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        storyPromptTextView.text = storyPrompt?.description
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
