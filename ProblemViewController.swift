//
//  ProblemViewController.swift
//  oops App
//
//  Created by Brandon Long on 5/27/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	@IBOutlet var userInputProblem: UITextView!
	
	var correctAnswer: Double!
	var hintText: String!
	
	@IBOutlet var userInputSolution: UITextView!
	
	
	@IBAction func buttonCheckAnswer(sender: AnyObject) {
		var numberOne: Double!
		var numberTwo: Double!
		var operatorType: String!
		
		let stringInput : String = userInputProblem.text
		var characters = Array(arrayLiteral: stringInput)
		print(characters)
		
		if characters.count < 6 {
			numberOne = Double(characters[0])
			operatorType = characters[2]
			numberTwo = Double(characters[4])
			
			if operatorType == "*" || operatorType == "x" {
				correctAnswer = numberOne * numberTwo
			}
			else if operatorType == "+"{
				correctAnswer = numberOne + numberTwo
			}
			else if operatorType == "-"{
				correctAnswer = numberOne - numberTwo
			}
			else if operatorType == "/"{
				correctAnswer = numberOne / numberTwo
			}
			
		}
		
		else {
			
			// 5 * 10 - 20 + 10
			
			correctAnswer = 40
		}
		
		if userInputSolution != correctAnswer {
			// generate pop up
			let alertController = UIAlertController(title: "iOScreator", message:
				"Hello, world!", preferredStyle: UIAlertControllerStyle.Alert)
			alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
			
			self.presentViewController(alertController, animated: true, completion: nil)
		}
		else {
			// move to congrats screen
			performSegueWithIdentifier("congratsSegue", sender: nil)
		}
		
		// convert user input to array
		
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
