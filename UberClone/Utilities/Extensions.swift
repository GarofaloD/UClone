//
//  Extensions.swift
//  UberClone
//
//  Created by Daniel Garofalo on 2/29/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit


extension UIView{
    
    //We used nil because we might not need them at all
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop : CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat? = nil, height: CGFloat? = nil){
        
        //Allows to add constraints programatically
        translatesAutoresizingMaskIntoConstraints = false
        
        //Asignment of values to properties, if provided
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom{
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true // Negative so it goes from teh bottom to the top
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true //Negative so it goes from right to left
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    //centering of the element
    func centerX(inView view:UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
}
