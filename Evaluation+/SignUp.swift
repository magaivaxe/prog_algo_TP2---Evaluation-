/*
  SignUp.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class SignUp: UIViewController
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
	var identification: Int!
	var username: String!
	var emailAddress: String!
	var password: String!
	var userData: (Int, String, String)!
	//-------------------------------
	
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		//----------- Classes -----------
		let style = Styles()
		//-------------------------------
		
    }

	@IBAction func buttonSignUp(_ sender: UIButton)
	{
		let save = SaveLoadMenager()
		
		identification = Int(fieldConcoIdentification.text!)
		username = fieldUsername.text!
		emailAddress = fieldEmailAddress.text!
		password = fieldPassword.text!
		
		let userData = (identification, emailAddress, password)
		
		save.saveData(theData: userData as AnyObject, fileName: username)
	}
	
	
}






























