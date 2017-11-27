/*
  SignIn.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class SignIn: UIViewController,
			  UITextFieldDelegate
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
		//let style = Styles()
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
				alert1(title: "Wrong password!",
					   message: "Enter the correct password.", tag: 1)
				fieldPassword.text?.removeAll()
				return
			}
		}
		else
		{
			alert2(title: "Username does not exist!",
				   message: "Try create an account. Do you want create it?", tag: 2)
		}
	}
	//=============================================================================

	//================================= Functions =================================
	
	//--------------- Alerts 1 ----------------
	
	func alert1(title t: String,
	           message m: String,
			   tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
		                              message: m,
		                              preferredStyle: UIAlertControllerStyle.alert)						// Constant wich go to show message and title alert
		
		//- Buttons -
		alert.addAction(UIAlertAction(title: "OK",
		                              style: UIAlertActionStyle.default,
		                              handler: { (action) in
										
			alert.dismiss(animated: true, completion: nil)
		}))
	
		self.present(alert, animated: true, completion: nil)
	}
	//------------------------------------------
	
	//--------------- Alerts 2 -----------------
	func alert2(title t: String,
				message m: String,
				tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)						// Constant wich go to show message and title alert

		//- Buttons -
		alert.addAction(UIAlertAction(title: "Yes",
									  style: UIAlertActionStyle.default,
									  handler: { (action) in
										
			alert.dismiss(animated: true, completion: nil)
			
			self.performSegue(withIdentifier: "segueSignUpAlert", sender: nil)
		}))
		
		alert.addAction(UIAlertAction(title: "No",
									  style: UIAlertActionStyle.default,
									  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
										
			self.fieldUsername.text?.removeAll()
			self.fieldPassword.text?.removeAll()
		}))

		self.present(alert, animated: true, completion: nil)
	}
	//-----------------------------------------
	
	//=============================================================================
	
	//============================ Keyboard fonctions =============================
	
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
	//----------------------------------
	
	//=============================================================================
}




















