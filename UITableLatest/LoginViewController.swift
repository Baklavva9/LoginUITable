//
//  LoginViewController.swift
//  UITableLatest
//
//  Created by Xcode Server on 11/5/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    
    @IBAction func loginDidTouch(_ sender: Any?) {
        
        (sender as! UIButton).alpha = 1.0
        
        Auth.auth().signInAnonymously { (firUser, error) in
            if error == nil {
                
                self.performSegue(withIdentifier: "showBudgetAll", sender: nil)
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        
    }
}

