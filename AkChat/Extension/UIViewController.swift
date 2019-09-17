//
//  UIViewController.swift
//  AkChat
//
//  Created by Amg on 17/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //MARK: - Manage Keyboard To View correctly View
    func setUpKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(manageKeyboardOut), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(manageKeyboardIn), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
    }
    
    @objc func manageKeyboardOut(_ notification: Notification) {
        if let frameKeyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, view.frame.minY == 0 {
            UIView.animate(withDuration: 0.25) {
                self.view.frame.origin.y -= frameKeyboard.height
            }
        }
    }
    
    @objc func manageKeyboardIn(_ notification: Notification) {
        UIView.animate(withDuration: 0.25) {
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}




extension UIViewController {
    //MARK: - Added Done Button on Keyboard When written in text Field
    func addDoneButtonOnKeyboard(_ textField: UITextField) {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        doneToolbar.barStyle       = UIBarStyle.default
        let flexSpace              = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem  = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(doneButtonAction))
        
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        textField.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
}
