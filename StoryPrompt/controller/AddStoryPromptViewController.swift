//
//  ViewController.swift
//  StoryPrompt
//
//  Created by Maurício de Freitas Sayão on 29/01/21.
//

import UIKit
import PhotosUI

enum TextFieldEnum: Int {
    case noun, adjective, verb
}

final class AddStoryPromptViewController: UIViewController  {
    
    @IBOutlet private var textFieldsCollection: [UITextField]!
    @IBOutlet private weak var numberLabel: UILabel!
    @IBOutlet private weak var numberSlider: UISlider!
    @IBOutlet private weak var storyPromptImageView: UIImageView!
    
    let storyPrompt = StoryPromptEntry()
    
    @objc private func chageImage() {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
    private func updateStoryPrompt() {
        storyPrompt.noun = textFieldBy(tag: .noun).text ?? .init()
        storyPrompt.adjective = textFieldBy(tag: .adjective).text ?? .init()
        storyPrompt.verb = textFieldBy(tag: .verb).text ?? .init()
    }
    
    private func textFieldBy(tag: TextFieldEnum) -> UITextField {
        return textFieldsCollection.first(where: {$0.tag == tag.rawValue})!
    }
    
    @IBAction private func generateStoryPrompt(_ sender: UIButton) {
        updateStoryPrompt()
        performSegue(withIdentifier: "StoryPrompSegue", sender: nil)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryPrompSegue" {
            guard let destination = segue.destination as? StoryPromptViewController else { return }
            
            destination.storyPrompt = storyPrompt
        }
    }
}

//MARK: Life cicle
extension AddStoryPromptViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSlider.value = 7.5
        
        storyPromptImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chageImage))
        
        storyPromptImageView.addGestureRecognizer(gestureRecognizer)
    }
    
}

//MARK: UITextFieldDelegate
extension AddStoryPromptViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let tag = TextFieldEnum(rawValue: textField.tag + 1) {
            textFieldBy(tag: tag).becomeFirstResponder()
        }
        
        textField.resignFirstResponder()
        
        return true
    }
    
}

//MARK: PHPickerViewControllerDelegate
extension AddStoryPromptViewController: PHPickerViewControllerDelegate {
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if !results.isEmpty {
            let result = results.first!
            let itemProvider = result.itemProvider
            
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                
                itemProvider.loadObject(ofClass: UIImage.self) {[ weak self] image, error in
                    
                    guard let image = image as? UIImage else { return }
                    
                    DispatchQueue.main.async {
                        self?.storyPromptImageView.image = image
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
}

