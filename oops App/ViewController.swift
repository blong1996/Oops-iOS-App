//
//  ViewController.swift
//  oops App
//
//  Created by User on 5/26/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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

