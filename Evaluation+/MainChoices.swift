/*
  MainChoices.swift
  Evaluation+

  Created by Marcos Gomes on 17-11-22.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
import Foundation
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

	@IBOutlet weak var field_student_name: UITextField!
	@IBOutlet weak var field_discipline_name: UITextField!
	
	@IBOutlet weak var table_view: UITableView!
	//-------------------------------
	
	//---------- Variables ----------
	var arrayStudents: [String]!; var arrayDisciplines: [String]!
	
	var rows: Int!
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
		
		//----
		
		//----

    }
	//================================= Buttons ===================================
	
	//---------- Sign Out -----------
	@IBAction func sign_out(_ sender: UIButton)
	{
		alert(title: "System exit!",
			  message: "Are you sure to exit the system?",
			  tag: 2)
	}
	//-------------------------------
	
	//------------- Add -------------
	@IBAction func search_student_discipline(_ sender: UIButton)
	{
		let save = SaveLoadMenager()	/* Class */
		
		let studentName = field_student_name.text!
		let disciplineName = field_discipline_name.text!
		
		if studentName == "" || disciplineName == ""
		{
			alert(title: "Blank field!",
				  message: "Fill the field of students or disciplines.",
				  tag: 1)
		}
		
		if sender.tag == 1
		{
			arrayStudents.append(studentName)
			field_student_name.text?.removeAll()
		}
		else
		{
			arrayDisciplines.append(disciplineName)
			field_discipline_name.text?.removeAll()
		}
		save.saveData(theData: arrayStudents as AnyObject, fileName: "studentsData")
		save.saveData(theData: arrayDisciplines as AnyObject, fileName: "disciplinesData")
		
		table_view.reloadData()
	}
	//-------------------------------
	
	//=============================================================================
	
	//=============================== Text fields =================================

	@IBAction func show_students_disciplines_names(_ sender: UITextField)
	{
		if sender.tag == 1			/* Students */
		{
			
		}
		else						/* Disciplines */
		{
			
		}
	}
	
	//=============================================================================
	
	//================================ Functions ==================================
	
	//------------ Alerts -----------
	func alert(title t: String,
			   message m: String,
			   tag: Int)
	{
		//- Alerts -
		let alert = UIAlertController(title: t,
									  message: m,
									  preferredStyle: UIAlertControllerStyle.alert)
		//- Buttons -
		if tag == 1
		{
			alert.addAction(UIAlertAction(title: "Ok",
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
											
				self.performSegue(withIdentifier: "signOut", sender: nil)
			}))
			
			alert.addAction(UIAlertAction(title: "No",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
				alert.dismiss(animated: true, completion: nil)
			}))
		}
	}
	//-------------------------------
	
	//--------- Load/Check ----------
	func load_check()
	{
		let load = SaveLoadMenager()
		
		if load.checkExistingSaves(fileName: "studentsData") == true,
		   load.checkExistingSaves(fileName: "disciplinesData") == true
		{
			arrayStudents = load.loadData(fileName: "studentsData") as! [String]
			arrayDisciplines = load.loadData(fileName: "disciplinesData") as! [String]
		}
		else
		{
			arrayStudents = [String](); arrayDisciplines = [String]()
			load.saveData(theData: arrayStudents as AnyObject, fileName: "studentsData")
			load.saveData(theData: arrayDisciplines as AnyObject, fileName: "disciplinesData")
		}
		table_view.reloadData()
	}
	//-------------------------------
	
	//=============================================================================
	
	//================================ Table View =================================
	
	//--------- Cells number --------
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
	{
		return arrayDisciplines.count
	}
	//-------------------------------
	
	//------- Cells contents --------
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,
													reuseIdentifier: nil)
		return cell
	}
	//-------------------------------
	//=============================================================================
}






































