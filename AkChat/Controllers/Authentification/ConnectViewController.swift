//
//  ConnectViewController.swift
//  AkChat
//
//  Created by Amg on 09/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
    
    //MARK: - @IBOUtlets
    @IBOutlet weak var containerView: ConnectViewLayerShadow!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: ButtonConnect!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    //MARK: - @IBActions
    @IBAction func logInBtn_Touch_Up_Inside(_ sender: UIButton) {
    }
    
    @IBAction func createAccountBtn_Touch_Up_Inside(_ sender: Any) {
    }
}

extension ConnectViewController {
    //MARK: - Functions
    private func setUpView() {
        activityIndicatorView.isHidden = true
        logInButton.isEnabled = false
        
        textFieldSetUp()
        addDoneButtonOnKeyboard(mailTextField)
        addDoneButtonOnKeyboard(passwordTextField)
    }
}

extension ConnectViewController {
    //MARK: - TextField
    private func textFieldSetUp() {
        mailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange() {
        guard let email = mailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty else {
            logInButton.isEnabled = false
            logInButton.setTitleColor(UIColor.lightGray, for: .normal)
            return
        }
        
        logInButton.setTitleColor(UIColor.white, for: .normal)
        logInButton.isEnabled = true
    }
}

extension ConnectViewController {
    //MARK: - Keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
