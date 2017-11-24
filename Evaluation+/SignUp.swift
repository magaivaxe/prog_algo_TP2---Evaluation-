/*
  SignUp.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class SignUp: UIViewController, UITextFieldDelegate
{
	//----------- Outlets -----------
	@IBOutlet weak var labelConcordia: UILabel!
	@IBOutlet weak var labelUsername: UILabel!
	@IBOutlet weak var labelEmail: UILabel!
	@IBOutlet weak var labelPassword: UILabel!
	@IBOutlet weak var labelTitle: UILabel!
	
	@IBOutlet weak var buttonSignUp: UIButton!
	@IBOutlet weak var imgViewLogo: UIImageView!
	@IBOutlet weak var viewSignUp: UIView!
	
	@IBOutlet weak var fieldConcoIdentification: UITextField!
	@IBOutlet weak var fieldUsername: UITextField!
	@IBOutlet weak var fieldEmailAddress: UITextField!
	@IBOutlet weak var fieldPassword: UITextField!
	//-------------------------------
	
	//----------- var/let -----------
	var identification: String!
	var username: String!
	var emailAddress: String!
	var password: String!
	var userData: [String]!
	//-------------------------------
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		//----------- Classes -----------
		let style = Styles()
		//-------------------------------
		
    }

	@IBAction func SignUp(_ sender: UIButton)
	{
		let save = SaveLoadMenager()
		
		identification = fieldConcoIdentification.text!
		username = fieldUsername.text!
		emailAddress = fieldEmailAddress.text!
		password = fieldPassword.text!
		
		//- Condotions to fail -
		if (identification == "" && username == "" &&
			emailAddress == "" && password == "")
		{
			alert2(title: "Avertissement!", message: "Do you want to go back to main page?")
		}
		if (identification == "" || username == "" ||
			emailAddress == "" || password == "")
		{
			alert1(title: "Avertissement!", message: "You have to fill all form fields.", tag: 1)
			
			return
		}
		//----------------------
		
		//--- Save on memory ---
		userData = [identification, emailAddress, password]				//Tuple of data User
		save.saveData(theData: userData as AnyObject, fileName: username)		//Tuple save by username file
		//----------------------
		
		fieldConcoIdentification.text?.removeAll()
		fieldUsername.text?.removeAll()
		fieldEmailAddress.text?.removeAll()
		fieldPassword.text?.removeAll()
		
		//-- Back to Sign In ---
		
		alert1(title: "Accomplished!", message: "Username and password successfully created.", tag: 2)
		
		//----------------------
		
	}
	
	
	
	
	//================================= Functions =================================
	
	//----------- Alerts Fonctions ------------
	func alert1(title t: String,
				message m: String,
				tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)			// Constant wich go to show message and title alert
		//----------
		
		//- Buttons -
		alert.addAction(UIAlertAction(title: "Ok",
									  style: UIAlertActionStyle.default,
									  handler: {(action) in
			alert.dismiss(animated: true,completion: nil)
										
			if tag == 2
			{
				self.performSegue(withIdentifier: "segueSignIn", sender: nil)
			}
		}))
		//-----------
		self.present(alert, animated: true, completion: nil)
	}
	
	func alert2(title t: String,
			   message m: String)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)			// Constant wich go to show message and title alert
		//----------
		
		//- Buttons -
		alert.addAction(UIAlertAction(title: "Yes",
									  style: UIAlertActionStyle.default,
									  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
			
			self.performSegue(withIdentifier: "segueSignIn", sender: nil)			//Go to Sign In page
		}))
		
		alert.addAction(UIAlertAction(title: "No",
									  style: UIAlertActionStyle.default,
									  handler: {(action) in alert.dismiss(animated: true,
																		  completion: nil)}))
		//-----------
		self.present(alert, animated: true, completion: nil)
	}
	//-------------------------------------------
	//=============================================================================
	
	//================================== Keyboard =================================
	
	//----- Touches begin anything -----
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{
		self.view.endEditing(true)		/* touches on view end the edition */
	}
	//----------------------------------
	
	//------ Field should return -------	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{
		textField.resignFirstResponder()		/* Key return hide the keyboard on text fields */
		return (true)
	}
	//----------------------------------
	
	//=============================================================================
	
}






























