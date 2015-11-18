//
//  ViewController.swift
//  LifeShare
//
//  Created by Alan Guerrero on 10/27/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import UIKit

var data:DataModel = DataModel()

class ViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    override func viewDidLoad() {
        self.loginSetup()
        
        super.viewDidLoad()
        self.loginSetup()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func loginSetup() {
        
        if (PFUser.currentUser() == nil) {
            //       let loginViewController = PFLogInViewController()
            let loginViewController = LoginViewController()
            loginViewController.delegate = self
            loginViewController.fields = [.UsernameAndPassword, .LogInButton, .PasswordForgotten, .SignUpButton, .Facebook]
            loginViewController.emailAsUsername = true
            loginViewController.signUpController!.delegate = self
            
            self.presentViewController(loginViewController, animated: false, completion: nil)        }
        else{
            presentLoggedInAlert()
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    func presentLoggedInAlert() {
        let alertController = UIAlertController(title: "You're logged in", message: "Welcome to Buzzed", preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
        presentLoggedInAlert()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        self.loginSetup()
        
        super.viewDidAppear(animated)
        
        self.loginSetup()
        
    }
    
}