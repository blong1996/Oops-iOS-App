//
//  LogoutViewController.swift
//  oops App
//
//  Created by Brandon Long on 5/27/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LogoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	@IBAction func buttonLogout(sender: AnyObject) {
		let loginManager = FBSDKLoginManager()
		loginManager.logOut()
		performSegueWithIdentifier("logoutSeg", sender: nil)
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
