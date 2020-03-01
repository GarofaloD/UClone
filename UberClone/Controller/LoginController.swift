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
    
    //MARK:- Outlets
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
    
    //MARK:- Buttons
    private let loginWhenPressed: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        button.backgroundColor = UIColor.mainBlueTint //From the Extensions
        button.layer.cornerRadius = 5
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return button
    }()
    
    private let signUpWhenPressed: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Dont have an account?  ", attributes:
                                                                     [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign Up!", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                                                   NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint]))
        //button.addTarget(self(), action: #selector(handleShowSignUp), for: .normal)
        button.setAttributedTitle(attributedTitle, for: .normal)
        
        return button
    }()
    
    
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = UIColor.backgroundColor //From the Extensions
        
        view.addSubview(titleLabel)
        //.Anchor() comes fromExtensions
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
     
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView,loginWhenPressed])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(signUpWhenPressed)
        signUpWhenPressed.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 16, height: 32)
        signUpWhenPressed.centerX(inView: view)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { //Clear the icons on top
        return .lightContent
    }
    
    
    
    
    
}
