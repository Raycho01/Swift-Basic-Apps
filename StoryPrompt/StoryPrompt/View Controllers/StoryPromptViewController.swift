//
//  StoryPromptViewController.swift
//  StoryPrompt
//
//  Created by Raycho Kostadinov on 3.05.22.
//

import UIKit

class StoryPromptViewController: UIViewController {

    var storyPrompt: StoryPromptEntry?
    
    var isNewStoryPrompt = false
    
    @IBOutlet weak var storyPromptTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        storyPromptTextView.text = storyPrompt?.description
        
        if isNewStoryPrompt {
            let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveStoryPrompt))
            let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelStoryPrompt))
            navigationItem.rightBarButtonItem = saveButton
            navigationItem.leftBarButtonItem = cancelButton
        }
    }
    
    @objc func cancelStoryPrompt() {
        performSegue(withIdentifier: "CancelStoryPrompt", sender: nil)
    }
    
    @objc func saveStoryPrompt() {
        NotificationCenter.default.post(name: .StoryPromptSaved, object: storyPrompt)
        performSegue(withIdentifier: "SaveStoryPrompt", sender: nil)
    }

}

extension Notification.Name {
    static let StoryPromptSaved = Notification.Name(rawValue: "StoryPromptSave")
}
