//
//  AuthButton.swift
//  UberClone
//
//  Created by Daniel Garofalo on 3/10/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit

class AuthButton: UIButton {

    //MARK:- Outlets
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = UIColor.mainBlueTint //From the Extensions
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
