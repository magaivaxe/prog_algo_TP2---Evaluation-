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
	var username, password: String!
	//-------------------------------
	override func viewDidLoad()
	{
		super.viewDidLoad()
		//----
		let style = Styles()
		//----
		style.styleUIImageView(imgViewLogo, UIImage(named: "logo.png"), 0,  0, UIColor.white.cgColor)
		
		style.styleUIView(viewSignIn, 10, 1,
						  UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
						  UIColor.white, 1)
		
		style.styleUITextField(fieldUsername, UIFont.init(name: "Champagne & Limousines", size: 17),
							   "Username", 10, 0.7,
							   UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
							   UIColor.white.cgColor)
		style.styleUITextField(fieldPassword, UIFont.init(name: "Champagne & Limousines", size: 17),
							   "Password", 10, 0.7,
							   UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
							   UIColor.white.cgColor)
		style.styleUIButtons(buttonSignIn, "Sign In", UIFont.init(name: "Champagne & Limousines", size: 17),
							 UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							 10, 1, UIColor.init(red: 243/255, green: 203/255, blue: 116/255, alpha: 1).cgColor,
							 UIColor.init(red: 254/255, green: 212/255, blue: 128/255, alpha: 1).cgColor, 1)
		style.styleUIView(viewSignUp, 10, 1,
						  UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
						  UIColor.white, 1)
		style.styleUIButtons(buttonCreateAccount, "Create an account",
							 UIFont.init(name: "Champagne & Limousines", size: 13),
							 UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1), 10, 0,
							 UIColor.white.cgColor, UIColor.init(white: 1, alpha: 0).cgColor, 1)
		
		labelQuestion.adjustsFontSizeToFitWidth = true
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
			{	// code to performe the present modaly by button
				performSegue(withIdentifier: "segueApp", sender: nil)
			}
			else
			{
				alert(title: "Wrong password!",
					   message: "Enter the correct password.", tag: 1)
				fieldPassword.text?.removeAll()
				return
			}
		}
		else
		{
			alert(title: "Username does not exist!",
				   message: "Try create an account. Do you want create it?", tag: 2)
		}
	}
	//=============================================================================
	//================================= Functions =================================
	//--------------- Alerts 1 ----------------
	func alert(title t: String,
	           message m: String,
			   tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,			// Constant wich go to show message and title alert
		                              message: m,
		                              preferredStyle: UIAlertControllerStyle.alert)
		//- Buttons and actions-
		if tag == 1
		{
			alert.addAction(UIAlertAction(title: "OK",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
			}))
		}
		if tag == 2
		{
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
		}
		self.present(alert, animated: true, completion: nil)
	}
	//------------------------------------------
	//=============================================================================
	//============================ Keyboard fonctions =============================
	//----- Touches begin anything -----
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{ self.view.endEditing(true) }
	//----------------------------------
	//------ Field should return -------
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		if textField == fieldUsername
		{fieldPassword.becomeFirstResponder()}
		else
		{fieldPassword.resignFirstResponder()}
		return true
	}
	//----------------------------------
	//=============================================================================
}




















