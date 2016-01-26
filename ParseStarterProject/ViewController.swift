/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var usernameSignup: UITextField!
    
    @IBOutlet weak var passwordSignup: UITextField!
    
    @IBOutlet weak var emailSignup: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBAction func loginModal(sender: AnyObject) {
        
        self.performSegueWithIdentifier("loginSegue", sender: self)
    }
    
    @IBAction func signupButton(sender: AnyObject) {
        let user = PFUser()
        user.username = usernameSignup.text
        user.password = passwordSignup.text
        user.email = emailSignup.text
        
        user.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            if error == nil {
                print("User Signed Up")
            self.performSegueWithIdentifier("loginSegue", sender: self)
                
            }
            if self.usernameSignup.text!.isEmpty || self.passwordSignup.text!.isEmpty || self.emailSignup.text!.isEmpty{
                
                let errorString = error!.userInfo["error"] as! NSString
               
                let alertController: UIAlertController = UIAlertController(title: "Uh Oh!", message: "\(errorString)", preferredStyle: UIAlertControllerStyle.Alert)
                
                let okAction = UIAlertAction(title: "Got it", style: UIAlertActionStyle.Default, handler: nil)
                
                alertController.addAction(okAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
                
        }
    }
        

    
    
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

   func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  }
}