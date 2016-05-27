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
	
	var correctAnswer: Int!
	var hintText: String!
	
	@IBOutlet var userInputSolution: UITextView!
	
	
	@IBAction func buttonCheckAnswer(sender: AnyObject) {
		var numberOne: Int!
		var numberTwo: Int!
		var simple: Bool!
		var operatorType: String!
		let input: String! = userInputProblem.text
		let userAnswer: Int! = Int(userInputSolution.text)
	
		
		let characters = input.characters.split{$0 == " "}.map(String.init)
		print(characters)
		
		if characters.count < 6 {
			simple = true
			numberOne = Int(characters[0])
			operatorType = characters[1]
			numberTwo = Int(characters[2])
			
			if operatorType == "*" || operatorType == "x" {
				correctAnswer = numberOne * numberTwo
				hintText = "Almost got it! Imagine if I gave you \(numberOne) Strawberries 🍓 every day for \(numberTwo) days. How many Strawberries 🍓 would you have afterwards?"
			}
			else if operatorType == "+"{
				correctAnswer = numberOne + numberTwo
				hintText = "Really close! Imagine if you had \(numberOne) Apples 🍎 and then I gave you \(numberTwo) more Apples 🍎. How many Apples would you have now?"
			}
			else if operatorType == "-"{
				correctAnswer = numberOne - numberTwo
				hintText = "Almost! Imagine if you had \(numberOne) Oranges 🍊 and then you gave me \(numberTwo) Oranges 🍊. How many Oranges would you have now?"
			}
			else if operatorType == "/"{
				correctAnswer = numberOne / numberTwo
				hintText = "So close! Imagine if you had \(numberOne) Pears 🍐 and you wanted to share them with \(numberTwo) students equally. How many Pears 🍐 would each student get"
			}
			
		}
		
		else {
			simple = false
			
			// 20 + 10 - 2 * 10 / 4 = 70
			
			correctAnswer = 25
			
			hintText = "Almost got it! Remember that you must do multiplication first, then division, and then addition and subtraction. You are \(userAnswer - correctAnswer) away from the right answer."
		}
		
		if userAnswer != correctAnswer {
			// generate pop up
			
				let alertController = UIAlertController(title: "Oops! \n🤗", message:
					hintText, preferredStyle: UIAlertControllerStyle.Alert)
				alertController.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default,handler: nil))
			
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
	/*class Node<T: Equatable> {
		var value: T? = nil
		var next: Node? = nil
	}
	
	class LinkedList<T: Equatable> {
		var head = Node<T>()
		
		func insert(value: T) {
			//find to see if empty list
			if self.head.value == nil {
    self.head.value == value
			} else {
    //find the last node without a next value
    var lastNode = self.head
    while lastNode.next != nil {
			lastNode = lastNode.next!
    }
    //once found, create a new node and connect the linked list
    let newNode = Node<T>()
    newNode.value = value
    lastNode.next = newNode
			}
		}
		
		func remove(value: T) {
			//Check if the value is at the head
			if self.head.value == value {
    self.head = self.head.next!
			}
			//Traverse the linked list to see if node is in the linked list
			if self.head.value != nil {
    var node = self.head
    var previousNode = Node<T>()
    //If value found, exit the loop
    while node.value != value && node.next! != nil {
			previousNode = node
			node = node.next!
    }
    //once found, connect the previous node to the current node's next
    if node.value == value {
			if node.next != nil {
				previousNode.next = node.next
			} else {
				//if at the end, the next is nil
				previousNode.next = nil
			}
    }
			}
		}
		
		
	} */



