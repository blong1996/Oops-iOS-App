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
					// Send over Username to Welcome screenu
			
        if segue.identifier == "welcomeSeg" {
        let nextVC = segue.destinationViewController as!
            WelcomeViewController
            nextVC.dataToBePassed = usernameField.text
        }
    }
	@IBAction func userNameLogin(sender: AnyObject) {
		// login/sign up button pressed, trigger welcome sigue
		
		performSegueWithIdentifier("welcomeSeg", sender: nil)
	}
    
}
extension ViewController: FBSDKLoginButtonDelegate {
	
	func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		if error == nil {
			loginButton.readPermissions = ["email"]
			// if login successful, continue to welcome screen
			fetchProfile()
			
		} else {
			print(error.localizedDescription)
		}
	}
	
	func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
		print("logged out successfully!")
	}
	
	func fetchProfile() {
		let parameters = ["fields": "email, first_name, last_name,"]
		FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
			
			if requestError != nil {
				print(requestError)
				return
			}
			
			var _ = user["email"] as? String
			let firstName = user["first_name"] as? String
			print(firstName)
	
			
			
		})
	}
	
}


