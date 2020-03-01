//
//  LoginController.swift
//  UberClone
//
//  Created by Daniel Garofalo on 2/29/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    //MARK:- Properties
    
    private let titleLabel : UILabel = { //Since it is a closure we have to create and return the label
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    private lazy var emailContainerView: UIView = { //Lazy so it adds the subview unly when needed
        //from Extensions, inputContainerView function
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true //Individual height
        return view
    }()
    
    private lazy var passwordContainerView: UIView = { //Lazy so it adds the subview unly when needed
        //from Extensions, inputContainerView function
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true // Individual height
        return view
    }()
    
    
    private let emailTextField : UITextField = {
        //from Extensions, textfield function
        return UITextField().textField(withPalaceholder: "Email", isSecureEntry: false)

    }()
    
    private let passwordTextField : UITextField = {
        //from Extensions, textfield function
        return UITextField().textField(withPalaceholder: "Password", isSecureEntry: true)
    }()
    
       
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        
        view.addSubview(titleLabel)
        //.Anchor() comes fromExtensions
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
     
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 16
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { //Clear the icons on top
        return .lightContent
    }
    
    
    
    
    
}
