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
				//code to pass to the next view
			}
		}
		else
		{
			//alert
		}
		
		
		
	}
	


}




















