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

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
	
	var fbName: String!
	override func viewDidLoad() {
		super.viewDidLoad()
		if let _ = FBSDKAccessToken.currentAccessToken() {
			fetchProfile()
			performSegueWithIdentifier("welcomeSeg", sender: nil)
			
		}

	}
	
	@IBOutlet var facebookLoginButton: FBSDKLoginButton!
	
    @IBOutlet weak var schoolField: UITextField!

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
	
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
					// Send over Username to Welcome screenu
			
        if segue.identifier == "welcomeSeg" {
        let nextVC = segue.destinationViewController as!
            WelcomeViewController
					if let _ = FBSDKAccessToken.currentAccessToken() {
						nextVC.dataToBePassed = self.fbName
					}
					else {
						nextVC.dataToBePassed = usernameField.text
					}
					
        }
    }
	@IBAction func userNameLogin(sender: AnyObject) {
		// login/sign up button pressed, trigger welcome segue
		if let _ = FBSDKAccessToken.currentAccessToken() {
			fetchProfile()
			
		} else {
		
		performSegueWithIdentifier("welcomeSeg", sender: nil)
		}
	}
	let loginButton: FBSDKLoginButton = {
		let button = FBSDKLoginButton()
		button.readPermissions = ["email"]
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
		
	
	@IBAction func loginFB(sender: AnyObject) {
		fetchProfile()
	}

	
	func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
		
		if error == nil {
			fetchProfile()
			// if login successful, continue to welcome screen
			performSegueWithIdentifier("welcomeSeg", sender: nil)
			
		} else {
			print(error.localizedDescription)
		}
	}
	
	func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
		// logout of facebook
		print("logged out successfully!")
	}
	
	func fetchProfile() {
		// retreive profile data
		
		
		let parameters = ["fields": "email, first_name, last_name"]
		FBSDKGraphRequest(graphPath: "me", parameters: parameters).startWithCompletionHandler({ (connection, user, requestError) -> Void in
			
			if requestError != nil {
				print(requestError)
				return
			}
			
			 // get first name
			let firstName = user["first_name"] as? String
			print(firstName)
			self.fbName = firstName
			self.performSegueWithIdentifier("welcomeSeg", sender: nil)
			
		})
	}
	
}


