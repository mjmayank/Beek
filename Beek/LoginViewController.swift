//
//  LoginViewController.swift
//  Beek
//
//  Created by Mayank Jain on 7/9/15.
//  Copyright (c) 2015 Mayank Jain. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginViewController : UIViewController{
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameTextField.becomeFirstResponder()
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTextField.text!.lowercaseString, password: passwordTextField.text!) { (user:PFUser?, error:NSError?) -> Void in
            if(error == nil){
                self.performSegueWithIdentifier("toFeed", sender: self)
            }
            else{
                print(error)
                var message = error!.userInfo as! [String: AnyObject]
                var alert = UIAlertController(title: "Error", message: message["NSLocalizedDescription"] as? String, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    deinit{
        
    }
}