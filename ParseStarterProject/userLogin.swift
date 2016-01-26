//
//  userLogin.swift
//  ParseStarterProject-Swift
//
//  Created by David Messer on 1/24/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse


class UserLogin: UIViewController {
    
    @IBOutlet weak var usernameLogin: UITextField!
    
    @IBOutlet weak var passwordLogin: UITextField!
    
   
    @IBAction func loginButton(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(self.usernameLogin.text!, password:self.passwordLogin.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil {
                print("User Logged In")
            self.dismissViewControllerAnimated(true, completion: nil)
                
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("userLoggedIn")
                self.showViewController(vc as! UIViewController, sender: vc)
                
            } else {
                let errorString = error!.userInfo["error"] as? NSString
                print("Error: \(errorString)")
            }
        }
    }

}