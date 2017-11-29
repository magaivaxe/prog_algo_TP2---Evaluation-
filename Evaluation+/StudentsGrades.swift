/*
  StudentsGrades.swift
  Evaluation+

  Created by eleves on 17-11-27.
  Copyright © 2017 Concordia Continuing Education (CCE). All rights reserved.
*/

//---------- Libraries ----------
import UIKit
//-------------------------------

class StudentsGrades: UIViewController,
                      UITextFieldDelegate,
   					  UITableViewDelegate,
   					  UITableViewDataSource
{
	//----------- Outlets -----------
    @IBOutlet weak var switch_grade: UISwitch!
    @IBOutlet weak var seg_grades: UISegmentedControl!
    @IBOutlet weak var tableview_disciplines: UITableView!
    
    @IBOutlet weak var slider_criteria1: UISlider!
    @IBOutlet weak var slider_criteria2: UISlider!
    @IBOutlet weak var slider_criteria3: UISlider!
    @IBOutlet weak var slider_criteria4: UISlider!
    @IBOutlet weak var slider_criteria5: UISlider!
    
    @IBOutlet weak var label_name: UILabel!
    @IBOutlet weak var label_grade1: UILabel!
    @IBOutlet weak var label_grade2: UILabel!
    @IBOutlet weak var label_grade3: UILabel!
    @IBOutlet weak var label_grade4: UILabel!
    @IBOutlet weak var label_grade5: UILabel!
    @IBOutlet weak var label_final_grade: UILabel!
    
	@IBOutlet weak var field_weight1: UITextField!
	@IBOutlet weak var field_weight2: UITextField!
	@IBOutlet weak var field_weight3: UITextField!
	@IBOutlet weak var field_weight4: UITextField!
	@IBOutlet weak var field_weight5: UITextField!
	
    @IBOutlet weak var button_return: UIButton!
    @IBOutlet weak var button_classrooms: UIButton!
    //-- statics texts --
    @IBOutlet weak var text_gradeOn30: UILabel!
    @IBOutlet weak var text_gradeOn100: UILabel!
    @IBOutlet weak var text_criteria1: UILabel!
    @IBOutlet weak var text_criteria2: UILabel!
    @IBOutlet weak var text_criteria3: UILabel!
    @IBOutlet weak var text_criteria4: UILabel!
    @IBOutlet weak var text_criteria5: UILabel!
    @IBOutlet weak var text_total_grade: UILabel!
    @IBOutlet weak var text_average_grade: UILabel!
    //--------------------
    //-------------------------------
	//---------- Variables ----------
	var studentName: String!
	var arrayDisciplines: [String]!
	var dictStudentGrades = [String:[String:[Double]]]()
	
	var currentDiscipline: String!
	var arrayGrades = [Double]()
	var arrayWeights: [Double]!
	var arrayCriterias: [Double]!
	var gradeOn: Int!
	
	var weight1: Double!
	var weight2: Double!
	var weight3: Double!
	var weight4: Double!
	var weight5: Double!
	
	var criteria1: Double!
	var criteria2: Double!
	var criteria3: Double!
	var criteria4: Double!
	var criteria5: Double!
	//-------------------------------
	//================================ viewDidLoad ================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
		
		//----
		load()
		//----
    }
	//=============================================================================
    //======================== Switch, Segmented and Sliders ======================
    @IBAction func switch_scale(_ sender: UISwitch)
    {
		if switch_grade.isOn == false					/* Grade on 30 */
		{
			
		}
		else											/* Grade on 100 */
		{
			
		}
    }
    
    @IBAction func grades_choices(_ sender: UISegmentedControl)
    {
		if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
		{
			
		}
		else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
		{
			
		}
		else											/* Final grade */
		{
			
		}
    }
    
    @IBAction func criterias(_ sender: UISlider)
    {
		let calculate = Calculate()

		switch sender.tag
		{
		case 0:
			criteria1 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade1 updated */
			{
				gradeOn = 30; criteria1 = calculate.GradeWithWeight(criterias: criteria1, gradeOn: gradeOn)
				label_grade1.text = String(criteria1)
			}
			else
			{
				gradeOn = 100; criteria1 = calculate.GradeWithWeight(criterias: criteria1, gradeOn: gradeOn)
				label_grade1.text = String(criteria1)
			}
			break
		case 1:
			criteria2 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade2 updated */
			{
				gradeOn = 30; criteria2 = calculate.GradeWithWeight(criterias: criteria2, gradeOn: gradeOn)
				label_grade2.text = String(criteria2)
			}
			else
			{
				gradeOn = 100; criteria2 = calculate.GradeWithWeight(criterias: criteria2, gradeOn: gradeOn)
				label_grade2.text = String(criteria2)
			}
			break
		case 2:
			criteria3 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade3 updated */
			{
				gradeOn = 30; criteria3 = calculate.GradeWithWeight(criterias: criteria3, gradeOn: gradeOn)
				label_grade3.text = String(criteria3)
			
			}
			else
			{
				gradeOn = 100; criteria3 = calculate.GradeWithWeight(criterias: criteria3, gradeOn: gradeOn)
				label_grade3.text = String(criteria3)
			}
			break
		case 3:
			criteria4 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade4 updated */
			{
				gradeOn = 30; criteria4 = calculate.GradeWithWeight(criterias: criteria4, gradeOn: gradeOn)
				label_grade4.text = String(criteria4)
			}
			else
			{
				gradeOn = 100; criteria4 = calculate.GradeWithWeight(criterias: criteria4, gradeOn: gradeOn)
				label_grade4.text = String(criteria4)
			}
			break
		case 4:
			criteria5 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade5 updated */
			{
				gradeOn = 30; criteria5 = calculate.GradeWithWeight(criterias: criteria5, gradeOn: gradeOn)
				label_grade5.text = String(criteria5)
			}
			else
			{
				gradeOn = 100; criteria5 = calculate.GradeWithWeight(criterias: criteria5, gradeOn: gradeOn)
				label_grade5.text = String(criteria5)
			}
			break
		default:
			break
		}
    }
    //=============================================================================
    //================================== Buttons ==================================
    @IBAction func return_students(_ sender: UIButton)
    {
        performSegue(withIdentifier: "segueReturn", sender: nil)
    }
    
    @IBAction func go_classrooms(_ sender: UIButton)
    {
		let calculate = Calculate()
		let save = SaveLoadMenager()
		
		weight1 = Double(field_weight1.text!)!
		weight2 = Double(field_weight2.text!)!
		weight3 = Double(field_weight3.text!)!
		weight4 = Double(field_weight4.text!)!
		weight5 = Double(field_weight5.text!)!
		
		arrayWeights = [weight1, weight2, weight3, weight4, weight5]
		arrayCriterias = [criteria1, criteria2, criteria3, criteria4, criteria5]
		
		if switch_grade.isOn == false					/* Grade on 30 */
		{
			gradeOn = 30
			if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
			{
				arrayGrades.append(calculate.totalGradeWithWeight(criterias: arrayCriterias,
																  weights: arrayWeights,
																  gradeOn: gradeOn))
				label_final_grade.text = String(arrayGrades[0])
			}
			else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
			{
				arrayGrades[1] = calculate.totalGradeWithWeight(criterias: arrayCriterias,
															weights: arrayWeights,
															gradeOn: gradeOn)
			}
			else											/* Final grade */
			{
				arrayGrades[2] = calculate.totalGradeWithWeight(criterias: arrayCriterias,
																weights: arrayWeights,
																gradeOn: gradeOn)
			}
		}
		else											/* Grade on 100 */
		{
			gradeOn = 100
			if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
			{
				arrayGrades[0] = calculate.totalGradeWithWeight(criterias: arrayCriterias,
																weights: arrayWeights,
																gradeOn: gradeOn)
			}
			else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
			{
				arrayGrades[1] = calculate.totalGradeWithWeight(criterias: arrayCriterias,
																weights: arrayWeights,
																gradeOn: gradeOn)
			}
			else											/* Final grade */
			{
				arrayGrades[2] = calculate.totalGradeWithWeight(criterias: arrayCriterias,
																weights: arrayWeights,
																gradeOn: gradeOn)
			}
		}
		
		alert(title: "Save the grades",
			  message: "Do you want to save or go to the class?",
			  tag: 1)
		
		if switch_grade.isOn == false
		{
			save.saveData(theData: arrayGrades as AnyObject,
						  fileName: "grades30")
			dictStudentGrades.updateValue([currentDiscipline:arrayGrades], forKey: studentName)
			save.saveData(theData: dictStudentGrades as AnyObject, fileName: "dictionary")
		}
		else
		{
			save.saveData(theData: arrayGrades as AnyObject,
						  fileName: "grades100")
			dictStudentGrades.updateValue([currentDiscipline:arrayGrades], forKey: studentName)
			save.saveData(theData: dictStudentGrades as AnyObject, fileName: "dictionary")
		}
		
    }
	//=============================================================================
	//================================= Keyboard ==================================
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
	{ self.view.endEditing(true) }
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool
	{ textField.resignFirstResponder(); return true }
    //=============================================================================
    //================================ Functions ==================================
	//------------ Alerts -----------
	func alert(title t: String,
			   message m: String,
			   tag: Int)
	{
		//- Alerts -
		let alert =  UIAlertController(title: t,
									   message: m,
									   preferredStyle: UIAlertControllerStyle.alert)
		//- Buttons -
		if tag == 1
		{
		alert.addAction(UIAlertAction(title: "Yes",
									  style: UIAlertActionStyle.default,
									  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
			
			
		}))
		alert.addAction(UIAlertAction(title: "Go",
									  style: UIAlertActionStyle.default,
									  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
			
			self.performSegue(withIdentifier: "segueTableView", sender: nil)
		}))
		}
		self.present(alert, animated: true, completion: nil)
	}
	//-------------------------------
	//--------- Data loads ----------
	func load()
	{
		let load = SaveLoadMenager()
		
		studentName = load.loadData(fileName: "student") as! String					/* Student name load */
		label_name.text = studentName												/* Show current name */
		
		arrayDisciplines = load.loadData(fileName: "disciplinesData") as! [String]	/* Disciplines array */
		
		if load.checkExistingSaves(fileName: "dictionary") == true
		{
			dictStudentGrades = load.loadData(fileName: "dictionary") as! [String:[String:[Double]]]
		}
		else
		{
			load.saveData(theData: dictStudentGrades as AnyObject, fileName: "dictionary")
		}
	}
	//-------------------------------
    //=============================================================================
    //================================ Table View =================================
	//--------- Cells number --------
    func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int
	{
		return arrayDisciplines.count
    }
    //-------------------------------
	//------- Cells contents --------
    func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default,
													reuseIdentifier: nil)
		
		cell.textLabel?.text = arrayDisciplines[indexPath.row]
		
		return cell
    }
	//-------------------------------
	//-------- Select cells ---------
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath)
	{
		let save = SaveLoadMenager()
		
		if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
		}
		else
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
			
			currentDiscipline = arrayDisciplines[indexPath.row]
			dictStudentGrades.updateValue([currentDiscipline:[]], forKey: studentName)
			
			save.saveData(theData: dictStudentGrades as AnyObject, fileName: "dictionary")
		}
		
	}
	//-------------------------------
	//=============================================================================

}































