/*
  ViewController.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------


class SignIn: UIViewController
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
			let userData = checkLoad.loadData(fileName: username) as! (Int, String, String)
			
			if userData.2 == password
			{
				performSegue(withIdentifier: "segueApp", sender: nil)			// code to performe the present modaly by button
			}
			else
			{
				//alert to try again
			}
		}
		else
		{
			//alert to Sign Up
		}
	}
	//=============================================================================

	//================================= Functions =================================
	
	func alert(title t: String,
	           message m: String)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
		                              message: m,
		                              preferredStyle: UIAlertControllerStyle.alert)
		//----------
		
		//- Buttons -
		alert.addAction(UIAlertAction(title: "OK",
		                              style: UIAlertActionStyle.default,
		                              handler: { (action) in alert.dismiss(animated: true,
		                                                                   completion: nil)}))
		//-----------
		self.present(alert, animated: true, completion: nil)
	}
	
	
	//=============================================================================
}




















