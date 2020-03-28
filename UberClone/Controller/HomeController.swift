//
//  HomeController.swift
//  UberClone
//
//  Created by Daniel Garofalo on 3/25/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    //MARK:- Properties
    
    //MARK:- Outlets
    
    //MARK:- Buttons
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        checkIfUserIsLoggedIn()
        view.backgroundColor = .red

    }
    
    //MARK:- Custom functions
    
    //MARK:- Helper Function
    
    
    //MARK:- API Functions
    //Checks if uswr is logged in before presenting this controller
    func checkIfUserIsLoggedIn(){
        //If User not logged in
        if Auth.auth().currentUser?.uid == nil {
            //Present loginController. This call needs to be made async since there is no way we cam guarantee immediate response
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: ")
            print("DEBUG: User UID: \(Auth.auth().currentUser?.uid)")
        }
    }
    
    //Sign out of the app
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch let error {
            print("DEBUG: Error signing out > \(error)")
        }
    }
    
    
}
