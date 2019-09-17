//
//  CreateAccountViewController.swift
//  AkChat
//
//  Created by Amg on 17/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneToKeyboard()
        setUpKeyboard()
    }

    //MARK: - @IBActions
    @IBAction func connectBtn_Touch_Up_Inside(_ sender: UIButton) {
    }
    
    @IBAction func returnLogInBtn_Touch_Up_inside(_ sender: Any) {
        view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
}

extension CreateAccountViewController {
    //MARK: - TextField
    private func addDoneToKeyboard() {
        addDoneButtonOnKeyboard(pseudoTextField)
        addDoneButtonOnKeyboard(nameTextField)
        addDoneButtonOnKeyboard(mailTextField)
        addDoneButtonOnKeyboard(passwordTextField)
        addDoneButtonOnKeyboard(checkPasswordTextField)
    }
}
