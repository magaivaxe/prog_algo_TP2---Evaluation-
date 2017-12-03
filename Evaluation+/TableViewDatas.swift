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
					  UITableViewDelegate,
					  UITableViewDataSource
{
	//----------- Outlets -----------
	@IBOutlet weak var switch_gradeOn: UISwitch!
	@IBOutlet weak var table_view: UITableView!
	

	
	@IBOutlet weak var return_button: UIButton!
	//- Static -
	@IBOutlet weak var label_gradeOn30: UILabel!
	@IBOutlet weak var label_gradeOn100: UILabel!
	//-------------------------------
	//---------- Variables ----------
	
	typealias student = String
	typealias course = String
	typealias grade = Double
	typealias grades = [Double]
	
	var cell: UITableViewCell!
	var arrayOfLabels: [UILabel]!
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
		let style = Styles()
		//----
		loads()
		//----
		setTuple()
		//----
		style.styleUITableView(table_view, 10, 1,
							   UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							   UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
							   UIColor.white.cgColor)
		style.styleSwitchGrade(switch_gradeOn, UIColor.init(red: 254/255, green: 211/255, blue: 127/255, alpha: 1),
							   UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1),
							   UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							   0, UIColor.black.cgColor)
		style.styleUIButtons(return_button, "Back", UIFont.init(name: "Champagne & Limousines", size: 17),
							 UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							 10, 1, UIColor.init(red: 243/255, green: 203/255, blue: 116/255, alpha: 1).cgColor,
							 UIColor.init(red: 254/255, green: 212/255, blue: 128/255, alpha: 1).cgColor, 1)
    }
	//=============================================================================
	//======================== Switch, Segmented and Sliders ======================
	
	@IBAction func gradeOn30_On100(_ sender: UISwitch)
	{
		table_view.reloadData()
	}
	
	//=============================================================================
	//================================ Functions ==================================
	func arrayToStyle()
	{
//		arrayOfLabels = [label_cell_name, label_cell_course, label_cell_grade1,
//						 label_cell_grade2, label_cell_grade3, label_cell_average]
	}
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
			if let studentName = cell.viewWithTag(100) as! UILabel!
			{ studentName.text = tupleStudentGrades30[indexPath.row].str1 }
			
			if let courseName = cell.viewWithTag(200) as! UILabel!
			{ courseName.text = tupleStudentGrades30[indexPath.row].arr[indexPath.row].str2 }
			
			if let grade1 = cell.viewWithTag(301) as! UILabel!
			{ grade1.text = String(tupleStudentGrades30[indexPath.row].arr[indexPath.row].num1) }
			
			if let grade2 = cell.viewWithTag(302) as! UILabel!
			{ grade2.text = String(tupleStudentGrades30[indexPath.row].arr[indexPath.row].num2) }
			
			if let grade3 = cell.viewWithTag(303) as! UILabel!
			{ grade3.text = String(tupleStudentGrades30[indexPath.row].arr[indexPath.row].num3) }
			
			if let average = cell.viewWithTag(304) as! UILabel!
			{ average.text = String((tupleStudentGrades30[indexPath.row].arr[indexPath.row].num1 +
				tupleStudentGrades30[indexPath.row].arr[indexPath.row].num2 +
				tupleStudentGrades30[indexPath.row].arr[indexPath.row].num3) / 3)}
		}
		else
		{
			if let studentName = cell.viewWithTag(100) as! UILabel!
			{ studentName.text = tupleStudentGrades100[indexPath.row].str1 }
			
			if let courseName = cell.viewWithTag(200) as! UILabel!
			{ courseName.text = tupleStudentGrades100[indexPath.row].arr[indexPath.row].str2 }
			
			if let grade1 = cell.viewWithTag(301) as! UILabel!
			{ grade1.text = String(tupleStudentGrades100[indexPath.row].arr[indexPath.row].num1) }
			
			if let grade2 = cell.viewWithTag(302) as! UILabel!
			{ grade2.text = String(tupleStudentGrades100[indexPath.row].arr[indexPath.row].num2) }
			
			if let average = cell.viewWithTag(304) as! UILabel!
			{ average.text = String((((tupleStudentGrades100[indexPath.row].arr[indexPath.row].num1 +
				tupleStudentGrades100[indexPath.row].arr[indexPath.row].num2 +
				tupleStudentGrades100[indexPath.row].arr[indexPath.row].num3) / 3) * 10).rounded() / 10)}
		}
		return cell
	}
	//-------------------------------
	//=============================================================================
}











































