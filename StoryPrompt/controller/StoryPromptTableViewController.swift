//
//  StoryPromptTableViewController.swift
//  StoryPrompt
//
//  Created by Maurício de Freitas Sayão on 18/03/21.
//

import UIKit

class StoryPromptTableViewController: UITableViewController {
    
    var storyPrompts = [StoryPromptEntry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story1 = StoryPromptEntry()
        let story2 = StoryPromptEntry()
        
        story1.adjective = "123"
        story1.noun = "123444"
        story1.verb = "adadfsf"
        
        story2.adjective = "123"
        story2.noun = "123444"
        story2.verb = "adadfsf"
        
        
        storyPrompts = [story1, story2]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        storyPrompts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryPromptCell", for: indexPath)
        
        cell.textLabel?.text = "Promp \(indexPath.row + 1)"
        cell.imageView?.image = storyPrompts[indexPath.row].image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyPromp = storyPrompts[indexPath.row]
        
        performSegue(withIdentifier: "StoryPromptCellSegue", sender: storyPromp)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StoryPromptCellSegue" {
            guard let destination = segue.destination as? StoryPromptViewController, let storyPrompt = sender as? StoryPromptEntry else { return }
            
            destination.storyPrompt = storyPrompt
        }
    }
    
}
