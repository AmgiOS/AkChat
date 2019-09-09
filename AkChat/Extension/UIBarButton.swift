//
//  UIBarButton.swift
//  AkChat
//
//  Created by Amg on 09/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

extension UIViewController {
    
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
