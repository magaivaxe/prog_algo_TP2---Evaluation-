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
	var identification, username, emailAddress, password: String!
	var arrayTextFields: [UITextField]!
	var userData: [String]!
	//-------------------------------
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		//----
		let style = Styles()
		//----
		arraysToStyle()
		//----
		style.styleUIImageView(imgViewLogo, UIImage.init(named: "logo.png"), 0, 0, UIColor.white.cgColor)
		
		style.styleUIView(viewSignUp, 10, 1,
						  UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
						  UIColor.white, 1)
		
		style.styleArrayOfUITextField(arrayTextFields, UIFont.init(name: "Champagne & Limousines", size: 17),
									  10, 0.7, UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
									  UIColor.white.cgColor)
		
		style.styleUIButtons(buttonSignUp, "Sign Up", UIFont.init(name: "Champagne & Limousines", size: 17),
							 UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1), 10, 1,
							 UIColor.init(red: 243/255, green: 203/255, blue: 116/255, alpha: 1).cgColor,
							 UIColor.init(red: 254/255, green: 212/255, blue: 128/255, alpha: 1).cgColor, 1)
		//----
		
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
	func arraysToStyle()
	{
		arrayTextFields = [fieldPassword, fieldUsername, fieldEmailAddress, fieldConcoIdentification]
	}
	//-----------------------------------------
	//----------- Alerts Fonctions ------------
	func alert1(title t: String,
				message m: String,
				tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,			// Constant wich go to show message and title alert
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)
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
		let alert = UIAlertController(title: t,			// Constant wich go to show message and title alert
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)
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
	{ self.view.endEditing(true) }
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






























