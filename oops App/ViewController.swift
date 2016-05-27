//
//  ViewController.swift
//  oops App
//
//  Created by User on 5/26/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController {
	
	@IBOutlet var facebookLoginButton: FBSDKLoginButton!
	
    @IBOutlet weak var schoolField: UITextField!

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "loginSegue" {
        let nextVC = segue.destinationViewController as!
            WelcomeViewController
            nextVC.dataToBePassed = usernameField.text
        }
    
    }
}
extension ViewController: FBSDKLoginButtonDelegate {
	
	func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		if error == nil {
			// if login successful, continue to welcome screen
			
			
		} else {
			print(error.localizedDescription)
		}
	}
	
	func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
		print("logged out successfully!")
	}
	
}


