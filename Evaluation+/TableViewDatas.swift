/*
  TableViewDatas.swift
  Evaluation+

  Created by eleves on 17-11-27.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class TableViewDatas: UIViewController,
					  UITextFieldDelegate,
					  UITableViewDelegate,
					  UITableViewDataSource
{
	//----------- Outlets -----------
	@IBOutlet weak var weight1: UITextField!
	@IBOutlet weak var weight2: UITextField!
	@IBOutlet weak var weight3: UITextField!
	
	@IBOutlet weak var switch_gradeOn: UISwitch!
	@IBOutlet weak var table_view: UITableView!
	
	@IBOutlet weak var avarage: UIButton!
	@IBOutlet weak var return_button: UIButton!
	//- Static -
	@IBOutlet weak var label_weights: UILabel!
	@IBOutlet weak var label_grade1: UILabel!
	@IBOutlet weak var label_grade2: UILabel!
	@IBOutlet weak var label_grade3: UILabel!
	@IBOutlet weak var label_gradeOn30: UILabel!
	@IBOutlet weak var label_gradeOn100: UILabel!
	//-------------------------------
	//---------- Variables ----------
	
	typealias student = String
	typealias course = String
	typealias grades = [Double]
	
	var weights1, weights2, weights3: Double!
	var arrayWeights: [Double]!
	
	var dictStudentGrades30 = [String:[String:[Double]]]()
	var dictStudentGrades100 = [String:[String:[Double]]]()
	var arrayCourses = [String]()
	var arrayDictGrades = [[String:[Double]]]()
	var arrayStudents = [String]()
	var arrayGrades = [Double]()
	
	var tupleStudentGrades30 = [(student: String, course: String, grade1: Double, grade2: Double, grade3: Double)]()
	var tupleStudentGrades100 = [(student: String, course: String, grade1: Double, grade2: Double, grade3: Double)]()
	//-------------------------------
	//================================ viewDidLoad ================================
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		//----
		loads()
		//----
		
		//----
    }
	//=============================================================================
	//================================ Functions ==================================
	//----------- Arrays ------------		/* Function to set the arrays */
	func setArrays()
	{
		if switch_gradeOn.isOn == false		/* grade on 30 */
		{
			
		}
		else								/* grade on 100 */
		{
			
		}
	}
	//-------------------------------
	//------------ Loads ------------
	func loads()
	{
		let load = SaveLoadMenager()
		
		dictStudentGrades30 = load.loadData(fileName: "dictionary30") as! [student:[course:grades]]
		dictStudentGrades100 = load.loadData(fileName: "dictionary100") as! [student:[course:grades]]
		
		if load.checkExistingSaves(fileName: "weightsAverage") == true
		{
			arrayWeights = load.loadData(fileName: "weightsAverage") as! [Double]
			weight1.text = String(arrayWeights[0]); weight2.text = String(arrayWeights[1])
			weight3.text = String(arrayWeights[2])
		}
		else
		{
			weights1 = Double(weight1.text!)!; weights2 = Double(weight2.text!)!
			weights3 = Double(weight3.text!)!
			arrayWeights = [weights1, weights2, weights3]
			load.saveData(theData: arrayWeights as AnyObject, fileName: "weightsAverage")
		}
	}
	//-------------------------------
	//=============================================================================
	//================================ Table View =================================
	//--------- Cells number --------
	func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int
	{ if switch_gradeOn.isOn == true  {return dictStudentGrades30.count}
	else  {return dictStudentGrades100.count} }
	//-------------------------------
	//------- Cells contents --------
	func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
		
		if switch_gradeOn.isOn == true
		{
//			if let studentName = cell.viewWithTag(100) as! UILabel!
//			{ studentName.text = [String]((dictStudentGrades.values)[indexPath.row]) }
//
//			if let courseName = cell.viewWithTag(200) as! UILabel!
//			{ courseName.text = String((arrayCourses_30)[indexPath.row]) }
//
//			if let grade1 = cell.viewWithTag(301) as! UILabel!
//			{ grade1.text = String((arrayGrade1_30)[indexPath.row]) }
//
//			if let grade2 = cell.viewWithTag(302) as! UILabel!
//			{ grade2.text = String((arrayGrade2_30)[indexPath.row]) }
//
//			if let grade3 = cell.viewWithTag(303) as! UILabel!
//			{ grade3.text = String((arrayGrade3_30)[indexPath.row]) }
		}
		else
		{
//			if let studentName = cell.viewWithTag(100) as! UILabel!
//			{ studentName.text = String((arrayStudents_100)[indexPath.row]) }
//
//			if let courseName = cell.viewWithTag(200) as! UILabel!
//			{ courseName.text = String((arrayCourses_100)[indexPath.row]) }
//
//			if let grade1 = cell.viewWithTag(301) as! UILabel!
//			{ grade1.text = String((arrayGrade1_100)[indexPath.row]) }
//
//			if let grade2 = cell.viewWithTag(302) as! UILabel!
//			{ grade2.text = String((arrayGrade2_100)[indexPath.row]) }
//
//			if let grade3 = cell.viewWithTag(303) as! UILabel!
//			{ grade3.text = String((arrayGrade3_100)[indexPath.row]) }
		}
		return cell
	}
	//-------------------------------
	//=============================================================================
	//================================= Keyboard ==================================
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{ self.view.endEditing(true) }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{ textField.resignFirstResponder(); return true }
	//=============================================================================
}











































