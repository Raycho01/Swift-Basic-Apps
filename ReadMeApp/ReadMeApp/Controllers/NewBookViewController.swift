//
//  NewBookViewController.swift
//  ReadMeApp
//
//  Created by Raycho Kostadinov on 9.05.22.
//

import UIKit

class NewBookViewController: UITableViewController {
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var bookImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bookImageView.layer.cornerRadius = 16
        tableView.allowsSelection = false
        tableView.separatorColor = .clear
    }
    
    @IBAction func updateImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera)
        ? .camera
        : .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    @IBAction func addBookButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
              let author = authorTextField.text else {
            return
        }
                
        let newBook = Book(title: title, author: author)
        Library.books.append(newBook)
        
        if let image = bookImageView.image {
            Library.saveImage(image, forBook: newBook)
        }

        navigationController?.popViewController(animated: true)
    }
}

extension NewBookViewController: UIImagePickerControllerDelegate,
                                    UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else {
            return
        }
        bookImageView.image = selectedImage
        dismiss(animated: true)
    }
}

extension NewBookViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleTextField {
            return authorTextField.becomeFirstResponder()
        } else {
            return textField.resignFirstResponder()
        }
    }
}
