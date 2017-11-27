/*
  MainChoices.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class MainChoices: UIViewController,
				   UITextFieldDelegate,
				   UITableViewDelegate,
				   UITableViewDataSource
{
	//----------- Outlets -----------
	@IBOutlet weak var sign_out: UIButton!
	@IBOutlet weak var add_student: UIButton!
	@IBOutlet weak var add_discipline: UIButton!

	@IBOutlet weak var student_name: UITextField!
	@IBOutlet weak var discipline_name: UITextField!
	
	@IBOutlet weak var table_view: UITableView!
	//-------------------------------
	
	//---------- Variables ----------
	var dictMain:[String:[String:[Double]]]!		/* [student:[disciplines:[grades]]] */
	//-------------------------------

    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		//----
		//let style = Styles()	/* Class to stylize */
		//----
		
		//----
		load_check()	/* Load/check existing files */
		//----

        // Do any additional setup after loading the view.
    }
	//================================= Buttons ===================================
	@IBAction func search_student_discipline(_ sender: UIButton)
	{
		
	}
	
	
	//=============================================================================
	
	//================================ Functions ==================================
	
	//--------- Load/Check ----------
	func load_check()
	{
		let load = SaveLoadMenager()
		
		if load.checkExistingSaves(fileName: "data") == true
		{
			dictMain = load.loadData(fileName: "data") as! [String:[String:[Double]]]
		}
		else
		{
			dictMain = [String:[String:[Double]]]()
			load.saveData(theData: dictMain as AnyObject, fileName: "data")
		}
	}
	//-------------------------------
	
	//=============================================================================
	
	//================================ Table View =================================
	
	//--------- Cells number --------
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		<#code#>
	}
	//-------------------------------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		<#code#>
	}
	//=============================================================================
}






































