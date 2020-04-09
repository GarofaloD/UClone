//
//  HomeController.swift
//  UberClone
//
//  Created by Daniel Garofalo on 3/25/20.
//  Copyright © 2020 Daniel Garofalo. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    //MARK:- Properties
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    private let inputActivationView = LocationInputActivationView()
    private let locationInputView = LocationInputView()
    
    //MARK:- Outlets
    
    //MARK:- Buttons
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //From API Functions
        checkIfUserIsLoggedIn()
        //From CLLocationManagerDelegate extension
        enableLocationServices()
        
    }
    
    //MARK:- Custom functions
    
    //MARK:- Helper Function
    //Min home view
    func configureUI(){
        configureMapView()
        
        //Where to? field
        view.addSubview(inputActivationView)
        inputActivationView.centerX(inView: view)
        inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        inputActivationView.alpha = 0
        inputActivationView.delegate = self
        
        UIView.animate(withDuration: 2){
            self.inputActivationView.alpha = 1
        }
    }
    
    //Map configuration
    func configureMapView(){
        //Home screen
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        //Calling for the user location
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }

    //View where directions will be handled
    func configureLocationInputView(){
                
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        locationInputView.alpha = 0
        locationInputView.delegate = self
        
        
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { _ in
            print("DEBUG: Present table View")
        }
    }
    
    
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
            print("DEBUG: User UID: \(Auth.auth().currentUser?.uid)")
            configureUI()
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

    //MARK:- Location Services

//Extension for Location services
extension HomeController: CLLocationManagerDelegate {
        
    private func enableLocationServices() {
         locationManager.delegate = self
         
         //Switches between status
         switch CLLocationManager.authorizationStatus() {
         case .notDetermined:  //It will always occur when opening the app for th firts time
             //This method blongs to CLLocationManager().
             locationManager.requestWhenInUseAuthorization()
         case .restricted, .denied:
             break
         case .authorizedAlways:
             print("DEBUG: Auth always")
             //obtain an initial location fix and then fine tune
             locationManager.startUpdatingLocation()
             locationManager.desiredAccuracy = kCLLocationAccuracyBest
         case .authorizedWhenInUse:
             //This one will be required to be abe to develop the app without the reprompting
             print("DEBUG: Auth when in use")
             locationManager.requestAlwaysAuthorization()
         @unknown default:
             break
         }
     }
    
//    Will prompt the user to auth always in such way that this stays in case the app is turned off for a long time
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
}

    //MARK:- LocationInputActivationViewDelegate
    //Delegation from LocationInputActivationView
extension HomeController : LocationInputActivationViewDelegate {
    
    func presentLocationInputView() {
        inputActivationView.alpha = 0
        configureLocationInputView()
    }
}

    //MARK:- LocationInputViewDelegate

extension HomeController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        //Fade the container view out
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
        }) { _ in
            //Fade the Where to? field in
            UIView.animate(withDuration: 0.3) {
                self.inputActivationView.alpha = 1
            }
        }
    }
    
    
}
