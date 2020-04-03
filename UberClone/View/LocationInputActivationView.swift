//
//  LocationInputActivationView.swift
//  UberClone
//
//  Created by Daniel Garofalo on 4/1/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit

class LocationInputActivationView: UIView {
    
    //MARK:- Properties
    
    //Indicator view (black dot) inside the where to field
    private let indicatorView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    //Placeholder inside the where to field
    private let placeholderLabel : UILabel = {
        let label = UILabel()
        label.text = "Where to?"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    
    
    //MARK:- Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Field visuals
        backgroundColor = .white
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.60
        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        layer.masksToBounds = false
        
        //Adding inddicator view
        addSubview(indicatorView)
        indicatorView.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 16)
        indicatorView.setDimensions(height: 6, width: 6)
        
        //Adding placeholder
        addSubview(placeholderLabel)
        placeholderLabel.centerY(inView: self, leftAnchor: indicatorView.rightAnchor, paddingLeft: 20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}
