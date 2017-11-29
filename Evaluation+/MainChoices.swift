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
	
	@IBOutlet weak var seg_students_disciplines: UISegmentedControl!
	@IBOutlet weak var table_view: UITableView!
	//-------------------------------
	//---------- Variables ----------
	var arrayStudents: [String]!; var arrayDisciplines: [String]!
	var sortedArrayStudents: [String]!; var sortedArrayDisciplines: [String]!
	
	var tagField: Int!
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
		//faire un objet sorted pour les array
		//----
		seg_students_disciplines.selectedSegmentIndex = 0
		//----

    }
	//================================= Buttons ===================================
	//---------- Sign Out -----------
	@IBAction func sign_out(_ sender: UIButton)
	{
		alert(title: "Sign out?!",
			  message: "Are you sure to quit?",
			  tag: 2)
	}
	//-------------------------------
	//------------- Add -------------
	@IBAction func search_student_discipline(_ sender: UIButton)
	{
		let save = SaveLoadMenager()	/* Class */
		
		let studentName = field_student_name.text!
		let disciplineName = field_discipline_name.text!
		
		if ((sender.tag == 1 && studentName == "") ||
			(sender.tag == 2 && disciplineName == ""))
		{
			alert(title: "Blank field!",
				  message: "Fill the field of students or disciplines.",
				  tag: 1)
			
			return
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
		
		sorted()
	}
	//-------------------------------
	//=============================================================================
	//=============================== Seg Control =================================
	@IBAction func show_students_disciplines(_ sender: UISegmentedControl)
	{
		if sender.selectedSegmentIndex == 0		/* Students */
		{
			sorted()
		}
		else									/* Disciplines */
		{
			sorted()
		}
	}
	//=============================================================================
	//================================ Functions ==================================
	//------------ Sorted -----------
    func sorted()
    {
        sortedArrayStudents = arrayStudents.sorted()
        sortedArrayDisciplines = arrayDisciplines.sorted()
        
        table_view.reloadData()
    }
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
											
				self.performSegue(withIdentifier: "signOut", sender: nil) 			/* Performe to signOut */
			}))
			
			alert.addAction(UIAlertAction(title: "No",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
				alert.dismiss(animated: true, completion: nil)
			}))
		}
		self.present(alert, animated: true, completion: nil)
	}
	//-------------------------------
	//--------- Load/Check ----------
	func load_check()								/* Load or create the first files */
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
		sorted()
	}
	//-------------------------------
	//---------- Keyboard -----------
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)	/* Touche on view to hide keyboard */
	{
		self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool				/* Return hide the keyboard */
	{
		textField.resignFirstResponder(); return true
	}
	//-------------------------------
	//=============================================================================
	//================================ Table View =================================
	//--------- Cells number --------
	
	func tableView(_ tableView: UITableView,								/* Number of rows */
				   numberOfRowsInSection section: Int) -> Int
	{
		if seg_students_disciplines.selectedSegmentIndex == 0
		{
			return sortedArrayStudents.count
		}
		else
		{
			return sortedArrayDisciplines.count
		}
	}
	//-------------------------------
	//------- Cells contents --------
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell	/* Rows contents */
	{
		let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,
													reuseIdentifier: nil)
		
		if seg_students_disciplines.selectedSegmentIndex == 0		/* Students */
		{
			cell.textLabel?.text = "\(sortedArrayStudents[indexPath.row])"
		}
		else														/* Disciplines */
		{
			cell.textLabel?.text = "\(sortedArrayDisciplines[indexPath.row])"
		}
		return cell
	}
	//-------------------------------
	//-------- Select cells ---------
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
	{
		let save = SaveLoadMenager()
		
		tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
		
		if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
		{
			let student = [String](sortedArrayStudents)[indexPath.row]
			save.saveData(theData: student as AnyObject, fileName: "student")
			
			if sortedArrayDisciplines != [String]()
			{
				performSegue(withIdentifier: "segueStudent", sender: nil)
			}
			else
			{
				alert(title: "No disciplines!", message: "Add disciplines to continue.", tag: 1)
				
				tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
			}
		}
	}

	//-------------------------------
	//-------- Delete Cells ---------
	func tableView(_ tableView: UITableView,
				   commit editingStyle: UITableViewCellEditingStyle,
				   forRowAt indexPath: IndexPath)					/* Rows delete */
	{
		let save = SaveLoadMenager()
		
		if seg_students_disciplines.selectedSegmentIndex == 0		/* Delete students rows */
		{
			if editingStyle == UITableViewCellEditingStyle.delete	/* Conditions to delete the sorted and normal arrays */
			{
                var i = 0; while i < arrayStudents.count
                {
                    if sortedArrayStudents[indexPath.row] == arrayStudents[i]
                    {
                        sortedArrayStudents.remove(at: indexPath.row)
                        arrayStudents.remove(at: i)
                        save.saveData(theData: arrayStudents as AnyObject, fileName: "studentsData")
                        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
                        tableView.reloadData()
                        return
                    }
                    i = i + 1
                }
			}
		}
		else														/* Delete Disciplines rows */
		{
			if editingStyle == UITableViewCellEditingStyle.delete
			{
                var j = 0; while j < arrayDisciplines.count
                {
                    if sortedArrayDisciplines[indexPath.row] == arrayDisciplines[j]
                    {
                        sortedArrayDisciplines.remove(at: indexPath.row)
                        arrayDisciplines.remove(at: j)
                        save.saveData(theData: arrayDisciplines as AnyObject, fileName: "disciplinesData")
                        tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
                        tableView.reloadData()
                        return
                    }
                    j = j + 1
                }
			}
		}
	}
	//-------------------------------
	//=============================================================================
}






































