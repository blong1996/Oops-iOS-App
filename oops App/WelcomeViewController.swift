//
//  WelcomeViewController.swift
//  oops App
//
//  Created by User on 5/26/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    
    @IBOutlet weak var heyLabel: UILabel!
    var dataToBePassed: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heyLabel.text = "Hey \(dataToBePassed)!"
    }
    
}
