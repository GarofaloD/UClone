//
//  SignUpController.swift
//  UberClone
//
//  Created by Daniel Garofalo on 3/7/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit

class SignUpController: UIViewController{
    
    //MARK:- Properties
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "UBER"
        label.font = UIFont(name: "Avenir-Light", size: 36)
        label.textColor = UIColor(white: 1, alpha: 0.8)
        return label
    }()
    
    //MARK:- Outlets
    
    private lazy var emailContainerView : UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var fullNameContainerView : UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullNameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView : UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var accountTypeContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_account_box_white_2x"), segmentedControl: accountTypeSegmentedControl)
        view.heightAnchor.constraint(equalToConstant: 80).isActive = true
        return view
    }()
    
    
    private let emailTextField : UITextField = {
        return UITextField().textField(withPalaceholder: "Email", isSecureEntry: false)
    }()
    
    private let fullNameTextField : UITextField = {
        return UITextField().textField(withPalaceholder: "Full Name", isSecureEntry: false)
    }()
    
    private let passwordTextField : UITextField = {
        return UITextField().textField(withPalaceholder: "Password", isSecureEntry: true)
    }()
    
    private let accountTypeSegmentedControl : UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Rider","Driver"])
        sc.backgroundColor = .backgroundColor //Custom from Extensions.swift
        sc.tintColor = UIColor(white: 1, alpha: 0.87) //Dark mode recommendation from Google
        //Add border color
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    
    //MARK:- Buttons
    private let signUpWhenPressed : AuthButton = {
        let button = AuthButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return button
    }()
    
    private let alreadyHaveAccountButton : UIButton = {
        let button = UIButton(type: .system)
       
        let attributedTitle = NSMutableAttributedString(string: "Already have an account? ",
                                                        attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16),
                                                                     NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Sign In",
                                                  attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
                                                               NSAttributedString.Key.foregroundColor : UIColor.mainBlueTint]))
        
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        
    }
    
    //MARK:- Custom functions / selectors
    @objc func handleShowLogin(){
        //Goes back to the previous vc by popping it out 
        navigationController?.popViewController(animated: true)
    }
    
    //MARK:- Helper Functions
    func configureUI(){
        
        view.backgroundColor = UIColor.backgroundColor
        
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,fullNameContainerView,passwordContainerView,accountTypeContainerView,signUpWhenPressed])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 16, height: 32)
        alreadyHaveAccountButton.centerX(inView: view)
        
        
    }
}
