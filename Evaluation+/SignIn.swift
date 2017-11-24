/*
  ViewController.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------


class SignIn: UIViewController, UITextFieldDelegate
{
	//----------- Outlets -----------
	@IBOutlet weak var imgViewLogo: UIImageView!
	@IBOutlet weak var labelTitle: UILabel!
	@IBOutlet weak var labelQuestion: UILabel!
	
	@IBOutlet weak var viewSignIn: UIView!
	@IBOutlet weak var viewSignUp: UIView!
	
	@IBOutlet weak var fieldUsername: UITextField!
	@IBOutlet weak var fieldPassword: UITextField!
	
	@IBOutlet weak var buttonSignIn: UIButton!
	@IBOutlet weak var buttonCreateAccount: UIButton!
	//-------------------------------
	
	//----------- var/let -----------
	var username: String!
	var password: String!
	//-------------------------------

	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		
		//----------- Classes -----------
		let style = Styles()
		//-------------------------------
		
		
		
	}
	//============================== Actions Buttons ==============================
	@IBAction func signIn(_ sender: UIButton)
	{
		let checkLoad = SaveLoadMenager()
		
		username = fieldUsername.text!
		password = fieldPassword.text!
		
		if checkLoad.checkExistingSaves(fileName: username) == true
		{
			let userData = checkLoad.loadData(fileName: username) as! [String]
			
			if userData[2] == password
			{
				performSegue(withIdentifier: "segueApp", sender: nil)			// code to performe the present modaly by button
			}
			else
			{
				alert(title: "Wrong password!", message: "Enter the correct password.", tag: 1)
			}
		}
		else
		{
			alert(title: "Username does not exist!", message: "Try create an account.", tag: 2)
		}
	}
	//=============================================================================

	//================================= Functions =================================
	
	func alert(title t: String,
	           message m: String,
			   tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
		                              message: m,
		                              preferredStyle: UIAlertControllerStyle.alert)						// Constant wich go to show message and title alert
		//----------
		
		//- Buttons -
		alert.addAction(UIAlertAction(title: "OK",
		                              style: UIAlertActionStyle.default,
		                              handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
										
			if tag == 2
			{
				self.performSegue(withIdentifier: "segueSignUpAlert", sender: nil)
			}
										
		}))			 //alert button
		//-----------
		self.present(alert,
					 animated: true,
					 completion: nil)
	}
	
	
	//=============================================================================
	
	//================================== Keyboard =================================
	
	//----- Touches begin anything -----
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		self.view.endEditing(true)
	}
	//----------------------------------
	
	
	//------ Field should return -------
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		textField.resignFirstResponder()
		
		return true
	}
	
	//=============================================================================
}




















