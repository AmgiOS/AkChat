//
//  ConnectViewController.swift
//  AkChat
//
//  Created by Amg on 09/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class ConnectViewController: UIViewController {
    //MARK: - Vars
    let connectViewModel = ConnectViewModel()
    
    //MARK: - @IBOUtlets
    @IBOutlet weak var containerView: ConnectViewLayerShadow!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: ButtonConnect!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpKeyboard()
        checkIfAlreadyConnect()
    }
    
    //MARK: - @IBActions
    @IBAction func logInBtn_Touch_Up_Inside(_ sender: UIButton) {
        signInService()
    }
    
    @IBAction func createAccountBtn_Touch_Up_Inside(_ sender: Any) {
        present(CreateAccountViewController(), animated: true, completion: nil)
    }
}

extension ConnectViewController {
    //MARK: - Set Up view
    private func setUpView() {
        activityIndicatorView.isHidden = true
        logInButton.isEnabled = false
        
        textFieldSetUp()
        addDoneButtonOnKeyboard(mailTextField)
        addDoneButtonOnKeyboard(passwordTextField)
        logoImageView.image = UIImage(named: "AkChatLogo")
        
        connectViewModel.alert = Alerts(controller: self)
    }
}
 
extension ConnectViewController {
    //MARK: - AuthService
    private func signInService() {
        guard let email = mailTextField.text, let password = passwordTextField.text else { return }
        connectViewModel.signIn.signIn(email, password, onSuccess: { (success) in
            self.logInButton.isHidden = true
            self.activityIndicatorView.isHidden = false
            if success {
                let navigationApp = NavigationTabBarViewController()
                navigationApp.modalTransitionStyle = .flipHorizontal
                navigationApp.modalPresentationStyle = .fullScreen
                
                self.present(navigationApp, animated: true, completion: nil)
            } else {
                self.connectViewModel.alertIfEmailAndPasswordIsIncorrect()
                self.logInButton.isHidden = false
                self.activityIndicatorView.isHidden = true
                self.passwordTextField.text = ""
            }
        })
    }
    
    private func checkIfAlreadyConnect() {
        connectViewModel.signIn.checkIfUserIsAlreadyOnline { (success) in
            if success {
                let navigationApp = NavigationTabBarViewController()
                navigationApp.modalTransitionStyle = .flipHorizontal
                navigationApp.modalPresentationStyle = .fullScreen
                
                self.present(navigationApp, animated: true, completion: nil)
            }
        }
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
