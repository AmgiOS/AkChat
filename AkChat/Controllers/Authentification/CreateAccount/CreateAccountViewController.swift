//
//  CreateAccountViewController.swift
//  AkChat
//
//  Created by Amg on 17/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    //MARK: - Vars
    let imagePicker = UIImagePickerController()
    let accountViewModel = CreateAccountViewModel()
    
    //MARK: - @IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var logInButton: ButtonConnect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchInDidLoad()
    }
    
    private func launchInDidLoad() {
        setUpViewKeyboard()
        setUpKeyboard()
        textFieldSetUp()
        setUpConfigPicker()
        accountViewModel.alert = Alerts(controller: self)
    }
}


extension CreateAccountViewController {
    //MARK: - @IBActions
    @IBAction func connectBtn_Touch_Up_Inside(_ sender: UIButton) {
        createUserInStorage()
    }
    
    @IBAction func returnLogInBtn_Touch_Up_inside(_ sender: Any) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
}

extension CreateAccountViewController {
    //MARK: - TextField
    private func setUpViewKeyboard() {
        addDoneButtonOnKeyboard(pseudoTextField)
        addDoneButtonOnKeyboard(nameTextField)
        addDoneButtonOnKeyboard(mailTextField)
        addDoneButtonOnKeyboard(passwordTextField)
        addDoneButtonOnKeyboard(checkPasswordTextField)
        
        profileImageView.image = UIImage(named: "photo_profil")
    }
    
    private func textFieldSetUp() {
        pseudoTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        mailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        checkPasswordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
       }
       
       @objc func textFieldDidChange() {
        guard let email = mailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let pseudo = pseudoTextField.text, !pseudo.isEmpty, let name = nameTextField.text, !name.isEmpty, let checkPass = checkPasswordTextField.text, !checkPass.isEmpty else {
               logInButton.isEnabled = false
               logInButton.setTitleColor(UIColor.lightGray, for: .normal)
               return
           }
           
           logInButton.setTitleColor(UIColor.white, for: .normal)
           logInButton.isEnabled = true
       }
}


extension CreateAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: - Image Picker Controller
    private func setUpConfigPicker() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesturePicture))
        profileImageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func tapGesturePicture() {
        accountViewModel.alert?.alertChoiceGetPhoto(imagePicker)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        guard let editingImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else { return }
        
        profileImageView.image = originalImage
        profileImageView.image = editingImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
}


extension CreateAccountViewController {
    //MARK: - Functions
    private func createUserInStorage() {
        view.endEditing(true)
        guard let password = passwordTextField.text, let checkPass = checkPasswordTextField.text else { return }
        if accountViewModel.checkIfPasswordIsAvailable(password, checkPass) {
            return
        }
        
        logInButton.isHidden = true
        activityIndicatorView.isHidden = false
        
        let imageJPEG = UIImage.jpegData(profileImageView.image ?? UIImage())(compressionQuality: 0.1)
        
        AuthServiceSignUp.shared.createUserInDatabase(pseudoTextField.text ?? "", nameTextField.text ?? "", mailTextField.text ?? "" , passwordTextField.text ?? "", imageJPEG: imageJPEG) { (success) in
            if success {
                self.dismiss(animated: true) {
                    let navigationApp = NavigationTabBarViewController()
                    navigationApp.modalTransitionStyle = .flipHorizontal
                    navigationApp.modalPresentationStyle = .fullScreen
                    self.present(navigationApp, animated: true, completion: nil)
                }
            }
        }
    }
}
