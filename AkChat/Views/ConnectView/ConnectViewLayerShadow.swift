//
//  ConnectViewLayerShadow.swift
//  AkChat
//
//  Created by Amg on 09/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class ConnectViewLayerShadow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewLayerShadow()
        
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViewLayerShadow()
    }
    
    //MARK: - Functions
    private func setUpViewLayerShadow() {
        self.layer.cornerRadius = 20
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 2.0
        self.layer.cornerRadius = 20
    }
}
