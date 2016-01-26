//
//  userFeed.swift
//  ParseStarterProject-Swift
//
//  Created by David Messer on 1/24/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import Foundation
import Parse

class UserFeed: UIViewController {
    
   
    @IBOutlet weak var currentUserLabel: UILabel!
    
    
    @IBAction func signOutButton(sender: AnyObject) {
        PFUser.logOut()
        if PFUser.currentUser()!.username == nil{
        let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("userLoginView")
        self.showViewController(vc as! UIViewController, sender: vc)
        print("User Logged Out")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currentUserLabel.text = "Welcome \(PFUser.currentUser()!["username"] as! String)"

    }
}