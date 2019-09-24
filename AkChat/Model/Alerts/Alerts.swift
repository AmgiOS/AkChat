//
//  Alerts.swift
//  AkChat
//
//  Created by Amg on 24/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class Alerts {
    
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    ///Alert To Display Choice get photo Camera or library
    func alertChoiceGetPhoto(_ imagePicker: UIImagePickerController) {
        let action = UIAlertController(title: "Choice How to get your Photo", message: "", preferredStyle: .alert)
        action.addAction(UIAlertAction(title: "Library", style: .default) { _ in
            imagePicker.sourceType = .photoLibrary
            self.controller.present(imagePicker, animated: true, completion: nil)
        })
        action.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                imagePicker.sourceType = .camera
                self.controller.present(imagePicker, animated: true, completion: nil)
            } else {
                self.alertCameraIsNotAvailable()
            }
        }))
        action.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        controller.present(action, animated: true, completion: nil)
    }
    
    
    /// Alert if camera is not available
    func alertCameraIsNotAvailable() {
        let error = UIAlertController(title: "Error", message: "No camera Device", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        error.addAction(cancel)
        controller.present(error, animated: true, completion: nil)
    }
    
    ///alert who dispaying anynthing message
    func alertDisplayingMessage(_ alert: String, _ message: String) {
        let alert = UIAlertController(title: alert, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok !", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}
