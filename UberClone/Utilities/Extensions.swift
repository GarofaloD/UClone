//
//  Extensions.swift
//  UberClone
//
//  Created by Daniel Garofalo on 2/29/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit


extension UIView { //This one is used for all the UIViews
    
    func inputContainerView(image: UIImage, textField: UITextField) -> UIView {
        let view = UIView()
        
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        
        view.addSubview(imageView)
        imageView.centerY(inView: view)
        imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
        
        view.addSubview(textField)
        textField.centerY(inView: view)
        textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        
        //Separator for the fields that we will need
        let separatorView = UIView()
        separatorView.backgroundColor = .gray
        view.addSubview(separatorView)
        separatorView.anchor(left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, height: 0.75)
        
        return view
    }
    
    
    
    
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
    func centerX(inView view: UIView) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView){
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
        
}


extension UITextField {
    
    func textField(withPalaceholder placeholder: String, isSecureEntry: Bool) -> UITextField{
        
         let textField = UITextField()
        
         textField.borderStyle = .none
         textField.font = UIFont.systemFont(ofSize: 16)
         textField.textColor = .white
         textField.keyboardAppearance = .dark //Keeps appearance of kdark mode for keyboard
        textField.isSecureTextEntry = isSecureTextEntry
         textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        return textField
    }
}
