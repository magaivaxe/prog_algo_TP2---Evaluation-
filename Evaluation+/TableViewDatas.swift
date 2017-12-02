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
	typealias grade = Double
	typealias grades = [Double]
	
	var weights1, weights2, weights3: Double!
	var arrayWeights: [Double]!
	
	var dictStudentGrades30 = [String:[String:[Double]]]()
	var dictStudentGrades100 = [String:[String:[Double]]]()
	
	var tupleStudentGrades30 = [(str1: student, arr: [(str2: course, num1: grade, num2: grade, num3: grade)])]()
	var tupleStudentGrades100 = [(str1: student, arr: [(str2: course, num1: grade, num2: grade, num3: grade)])]()
	//-------------------------------
	//================================ viewDidLoad ================================
    override func viewDidLoad()
	{
        super.viewDidLoad()
		
		//----
		loads()
		//----
		setTuple()
		//----
    }
	//=============================================================================
	//======================== Switch, Segmented and Sliders ======================
	
	
	//=============================================================================
	//================================ Functions ==================================
	//----------- Arrays ------------		/* Function to set the arrays */
	func setTuple()
	{
		let conversion = DictionaryToTuple()
		
		tupleStudentGrades30 = conversion.dictType1(dictStudentGrades30)
		
		tupleStudentGrades100 = conversion.dictType1(dictStudentGrades100)
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
		
		if switch_gradeOn.isOn == false
		{
			for i in 0..<tupleStudentGrades30[indexPath.row].arr.count
			{
				if let studentName = cell.viewWithTag(100) as! UILabel!
				{ studentName.text = tupleStudentGrades30[indexPath.row].str1 }
				
				if let courseName = cell.viewWithTag(200) as! UILabel!
				{ courseName.text = tupleStudentGrades30[indexPath.row].arr[i].str2 }
				
				if let grade1 = cell.viewWithTag(301) as! UILabel!
				{ grade1.text = String(tupleStudentGrades30[indexPath.row].arr[i].num1) }
				
				if let grade2 = cell.viewWithTag(302) as! UILabel!
				{ grade2.text = String(tupleStudentGrades30[indexPath.row].arr[i].num2) }
				
				if let grade3 = cell.viewWithTag(303) as! UILabel!
				{ grade3.text = String(tupleStudentGrades30[indexPath.row].arr[i].num3) }
			}
			
		}
		else
		{
			for j in 0..<tupleStudentGrades100[indexPath.row].arr.count
			{
				if let studentName = cell.viewWithTag(100) as! UILabel!
				{ studentName.text = tupleStudentGrades100[indexPath.row].str1 }
				
				if let courseName = cell.viewWithTag(200) as! UILabel!
				{ courseName.text = tupleStudentGrades100[indexPath.row].arr[j].str2 }
				
				if let grade1 = cell.viewWithTag(301) as! UILabel!
				{ grade1.text = String(tupleStudentGrades100[indexPath.row].arr[j].num1) }
				
				if let grade2 = cell.viewWithTag(302) as! UILabel!
				{ grade2.text = String(tupleStudentGrades100[indexPath.row].arr[j].num2) }
				
				if let grade3 = cell.viewWithTag(303) as! UILabel!
				{ grade3.text = String(tupleStudentGrades100[indexPath.row].arr[j].num3) }
			}
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











































