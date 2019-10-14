//
//  ConnectViewModel.swift
//  AkChat
//
//  Created by Amg on 14/10/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import Foundation

class ConnectViewModel {
    //MARK: - Vars
    let signIn = AuthServiceSignIn()
    var alert: Alerts?
    
    //MARK: - Functions
    func alertIfEmailAndPasswordIsIncorrect() {
        alert?.alertDisplayingMessage("Error your email or password is incorrect", "check if your email or password is correct")
    }
}
