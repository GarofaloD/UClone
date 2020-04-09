//
//  LocationInputView.swift
//  UberClone
//
//  Created by Daniel Garofalo on 4/8/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit

protocol LocationInputViewDelegate: class {
    func dismissLocationInputView()
}

class LocationInputView: UIView {

    //MARK:- Properties
    //Dismiss input
    
    weak var delegate : LocationInputViewDelegate?
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addShadow()
        backgroundColor = .white
        
        addSubview(backButton)
        backButton.anchor(top: topAnchor, left: leftAnchor, paddingTop: 44, paddingLeft: 12, width: 24, height: 24)
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Helper Functions
    @objc func handleBackTapped() {
        //print("DEBUG: handle back")
        delegate?.dismissLocationInputView()
    }
    
    //MARK:- Properties

}
