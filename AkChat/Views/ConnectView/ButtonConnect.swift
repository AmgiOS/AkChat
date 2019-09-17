//
//  ButtonConnect.swift
//  AkChat
//
//  Created by Amg on 09/09/2019.
//  Copyright © 2019 Amg-Gauthier. All rights reserved.
//

import UIKit

class ButtonConnect: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBtnLayerShadow()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpBtnLayerShadow()
    }
    
    //MARK: - Functions
    private func setUpBtnLayerShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7).cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 20
    }
}
