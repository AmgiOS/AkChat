//
//  CreateAccountViewModel.swift
//  AkChat
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class CreateAccountViewModel {
    //MARK: - Vars
    var alert: Alerts?
    
    //MARK: - Functions
    func checkIfPasswordIsAvailable(_ pass: String, _ pass2: String) -> Bool {
        if pass != pass2 || pass.count < 6 {
            alert?.alertDisplayingMessage("Error", "The passwords are different or contains below 6 characters")
            return true
        }
        return false
    }
}
