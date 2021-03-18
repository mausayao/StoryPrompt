//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Maurício de Freitas Sayão on 18/03/21.
//

import UIKit

final class StoryPromptViewController: UIViewController {

    @IBOutlet private weak var storyPromptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
