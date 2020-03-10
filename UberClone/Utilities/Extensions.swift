//
//  Extensions.swift
//  UberClone
//
//  Created by Daniel Garofalo on 2/29/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit


extension UIView { //This one is used for all the UIViews
    
    func inputContainerView(image: UIImage, textField: UITextField? = nil, segmentedControl : UISegmentedControl? = nil) -> UIView {
        //Container creation
        let view = UIView()
        
        //image management
        let imageView = UIImageView()
        imageView.image = image
        imageView.alpha = 0.87
        //Add image to the view
        view.addSubview(imageView)
        
        //Add text field to the view, if we are passing a textfield
        if let textField = textField {
            imageView.centerY(inView: view)
            imageView.anchor(left: view.leftAnchor, paddingLeft: 8, width: 24, height: 24)
            
            view.addSubview(textField)
            textField.centerY(inView: view)
            textField.anchor(left: imageView.rightAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 8, paddingBottom: 8)
        }
        
        //Add a segmented control, if we are passing the segmented control
        if let sc = segmentedControl {
            imageView.anchor(top: view.topAnchor, left: view.leftAnchor, paddingTop: -8, paddingLeft: 8, width: 24, height: 24)
            view.addSubview(sc)
            sc.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 8, paddingRight: 8)
            sc.centerY(inView: view, constant: 8)
        }
        
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
    
    func centerY(inView view: UIView, constant: CGFloat = 0){
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
        
}


extension UITextField {
    
    func textField(withPalaceholder placeholder: String, isSecureEntry: Bool) -> UITextField{
        //Creation of the textfield
         let textField = UITextField()
        
        //Textfield stock variables and parameters
         textField.borderStyle = .none
         textField.font = UIFont.systemFont(ofSize: 16)
         textField.textColor = .white
         textField.keyboardAppearance = .dark //Keeps appearance of kdark mode for keyboard
         textField.isSecureTextEntry = isSecureTextEntry
         textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        
        return textField
    }
}


extension UIColor {
    
    //Color management function: Simplifies the customizatiion of colors
    static func rgbaColors(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    //Some tock colors
    static let backgroundColor = UIColor.rgbaColors(red: 25, green: 25, blue: 25, alpha: 1)
    static let mainBlueTint = UIColor.rgbaColors(red: 17, green: 154, blue: 237, alpha: 1)
    
}
