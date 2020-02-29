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
    
       
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.init(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        view.addSubview(titleLabel)
        
        //From Extensions
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
        
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { //Clear the icons on top
        return .lightContent
    }
    
    
    
    
    
}
