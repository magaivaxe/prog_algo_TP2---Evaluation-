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
	typealias student = String
	typealias course = String
	typealias grades = [Double]
	
	var cell: UITableViewCell!
	var studentName: String!
	var arrayCourses: [String]!
	var currentCourse: String?
	var dictStudentGrades30 = [student:[course:grades]]()
	var dictStudentGrades100 = [student:[course:grades]]()

	var gradeOn: Int!
	var weight1, weight2, weight3, weight4, weight5,
		criteria1, criteria2, criteria3, criteria4,
		criteria5, grade30_1, grade30_2, grade30_3,
		grade100_1, grade100_2, grade100_3: Double!
	
	var arrayWeights, arrayCriterias,
		arrayGrades30, arrayGrades100: [Double]!
	var arrayGrades: [Double]!;
	var arraySliders: [UISlider]!; var arrayLabels: [UILabel]!
	var arrayFields: [UITextField]!; var arrayButtons: [UIButton]!
	//-------------------------------
	//================================ viewDidLoad ================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
		//----
		let style = Styles()
		//----
		arraysToStyle()
		//----
		style.styleArrayOfUIButtons(arrayButtons, UIFont.init(name: "Champagne & Limousines", size: 17),
									UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
									10, 1, UIColor.init(red: 243/255, green: 203/255, blue: 116/255, alpha: 1).cgColor,
									UIColor.init(red: 254/255, green: 212/255, blue: 128/255, alpha: 1).cgColor, 1)
		style.styleArrayOfUILabel(arrayLabels, UIFont.init(name: "Champagne & Limousines", size: 17),
								  NSTextAlignment.center, 10, 1,
								  UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
								  UIColor.black, UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1).cgColor)
		style.styleArrayOfUITextField(arrayFields, UIFont.init(name: "Champagne & Limousines", size: 17),
									  10, 0.7, UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
									  UIColor.white.cgColor)
		style.styleArraySliders(arraySliders, UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
								UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1),
								UIColor.init(red: 254/255, green: 211/255, blue: 127/255, alpha: 1))
		style.styleUISegmentedControl(seg_grades, 10, 0.8,
									  UIColor.init(red: 254/255, green: 211/255, blue: 127/255, alpha: 1),
									  UIColor.init(red: 243/255, green: 203/255, blue: 116/255, alpha: 1).cgColor,
									  UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1).cgColor)
		
		style.styleUITableView(tableview_disciplines, 10, 1,
							   UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							   UIColor.init(red: 209/255, green: 213/255, blue: 218/255, alpha: 1).cgColor,
							   UIColor.white.cgColor)
		style.styleSwitchGrade(switch_grade, UIColor.init(red: 254/255, green: 211/255, blue: 127/255, alpha: 1),
							   UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1),
							   UIColor.init(red: 111/255, green: 113/255, blue: 121/255, alpha: 1),
							   0, UIColor.black.cgColor)
		//----
		loadData()
		//----
		label_name.text = studentName								/* Show current name */
		
		grade30_1 = 0.0; grade30_2 = 0.0; grade30_3 = 0.0			/* Initial grades values */
		grade100_1 = 0.0; grade100_2 = 0.0; grade100_3 = 0.0
		
		criteria1 = 0.0; criteria2 = 0.0; criteria3 = 0.0			/* Initial criteria values */
		criteria4 = 0.0; criteria5 = 0.0
		
		label_grade1.text = "0.0"; label_grade2.text = "0.0";		/* Initial label values */
		label_grade3.text = "0.0"; label_grade4.text = "0.0";
		label_grade5.text = "0.0";
		//----
    }
	//=============================================================================
	//================================ Functions ==================================
	func arraysToStyle()
	{
		arrayButtons = [button_return, button_classrooms]
		arraySliders = [slider_criteria1, slider_criteria2, slider_criteria3,
						slider_criteria4, slider_criteria5]
		arrayFields = [field_weight1, field_weight2, field_weight3,
					   field_weight4, field_weight5]
		arrayLabels = [label_name, label_grade1, label_grade2,
					   label_grade3, label_grade4, label_grade5, label_final_grade]
	}
	//------------ Alerts -----------
	func alert(title t: String,
			   message m: String,
			   tag: Int)
	{
		//- Alert -			/* contants */
		let alert =  UIAlertController(title: t,
									   message: m,
									   preferredStyle: UIAlertControllerStyle.alert)
		//- Buttons -
		if tag == 1			/* Save or go */
		{
			alert.addAction(UIAlertAction(title: "Yes",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
											alert.dismiss(animated: true, completion: nil)
			}))
			alert.addAction(UIAlertAction(title: "No and Go",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
											
			self.performSegue(withIdentifier: "segueTableView", sender: nil)
			}))
		}
		
		if tag == 2			/* Alert simple */
		{
			alert.addAction(UIAlertAction(title: "Ok",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
			}))
		}
		
		if tag == 3			/* Return to add student */
		{
			alert.addAction(UIAlertAction(title: "Yes",
										  style: UIAlertActionStyle.default,
										  handler: { (action) in
			alert.dismiss(animated: true, completion: nil)
											
			self.performSegue(withIdentifier: "segueReturn", sender: nil)
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
	//--------- Data loads ----------
	func loadData()
	{
		let load = SaveLoadMenager()
		
		studentName = load.loadData(fileName: "student") as! String					/* Student name load */
		arrayCourses = load.loadData(fileName: "coursesData") as! [String]			/* Load the courses array */
		
		//-----------------------------------------------------------:) Load the weights
		if load.checkExistingSaves(fileName: "weights") == true
		{
			arrayWeights = load.loadData(fileName: "weights") as! [Double]
			
			field_weight1.text! = String(arrayWeights[0]); field_weight2.text! = String(arrayWeights[1])
			field_weight3.text! = String(arrayWeights[2]); field_weight4.text! = String(arrayWeights[3])
			field_weight5.text! = String(arrayWeights[4])
		}
		else
		{
			weight1 = Double(field_weight1.text!)!; weight2 = Double(field_weight2.text!)!
			weight3 = Double(field_weight3.text!)!; weight4 = Double(field_weight4.text!)!
			weight5 = Double(field_weight5.text!)!
			
			arrayWeights = [weight1, weight2, weight3, weight4, weight5]
			
			load.saveData(theData: arrayWeights as AnyObject, fileName: "weights")
		}
		
		//-----------------------------------------------------------:) Load the dictionaries
		if load.checkExistingSaves(fileName: "dictionary30") == true
		{
			dictStudentGrades30 = load.loadData(fileName: "dictionary30") as! [String:[String:[Double]]]
		}
		else
		{
			load.saveData(theData: dictStudentGrades30 as AnyObject, fileName: "dictionary30")
		}
		if load.checkExistingSaves(fileName: "dictionary100") == true
		{
			dictStudentGrades100 = load.loadData(fileName: "dictionary100") as! [String:[String:[Double]]]
		}
		else
		{
			load.saveData(theData: dictStudentGrades100 as AnyObject, fileName: "dictionary100")
		}
		
	}
	//-------------------------------
	//=============================================================================
    //======================== Switch, Segmented and Sliders ======================
	//------------ Switch -----------
    @IBAction func switch_scale(_ sender: UISwitch)
    {
		if switch_grade.isOn == false					/* Grade on 30 */
		{
			alert(title: "Grade on 30 now", message: "All grade will be calculated on 30", tag: 2)
			label_grade1.text = ""; label_grade2.text = "";
			label_grade3.text = ""; label_grade4.text = "";
			label_grade5.text = ""; label_final_grade.text = "";
			slider_criteria1.setValue(0, animated: true); slider_criteria2.setValue(0, animated: true)
			slider_criteria3.setValue(0, animated: true); slider_criteria4.setValue(0, animated: true)
			slider_criteria5.setValue(0, animated: true)
		}
		else											/* Grade on 100 */
		{
			alert(title: "Grade on 100 now", message: "All grade will be calculated on 100", tag: 2)
			label_grade1.text = ""; label_grade2.text = "";
			label_grade3.text = ""; label_grade4.text = "";
			label_grade5.text = ""; label_final_grade.text = "";
			slider_criteria1.setValue(0, animated: true); slider_criteria2.setValue(0, animated: true)
			slider_criteria3.setValue(0, animated: true); slider_criteria4.setValue(0, animated: true)
			slider_criteria5.setValue(0, animated: true)
		}
    }
    //-------------------------------
	//------ Segmented control ------
    @IBAction func grades_choices(_ sender: UISegmentedControl)
    {
		if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
		{
			label_grade1.text = ""; label_grade2.text = "";
			label_grade3.text = ""; label_grade4.text = "";
			label_grade5.text = ""; label_final_grade.text = "";
			slider_criteria1.setValue(0, animated: true); slider_criteria2.setValue(0, animated: true)
			slider_criteria3.setValue(0, animated: true); slider_criteria4.setValue(0, animated: true)
			slider_criteria5.setValue(0, animated: true)
		}
		else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
		{
			label_grade1.text = ""; label_grade2.text = "";
			label_grade3.text = ""; label_grade4.text = "";
			label_grade5.text = ""; label_final_grade.text = "";
			slider_criteria1.setValue(0, animated: true); slider_criteria2.setValue(0, animated: true)
			slider_criteria3.setValue(0, animated: true); slider_criteria4.setValue(0, animated: true)
			slider_criteria5.setValue(0, animated: true)
		}
		else											/* Final grade */
		{
			label_grade1.text = ""; label_grade2.text = "";
			label_grade3.text = ""; label_grade4.text = "";
			label_grade5.text = ""; label_final_grade.text = "";
			slider_criteria1.setValue(0, animated: true); slider_criteria2.setValue(0, animated: true)
			slider_criteria3.setValue(0, animated: true); slider_criteria4.setValue(0, animated: true)
			slider_criteria5.setValue(0, animated: true)
		}
    }
    //-------------------------------
	//----------- Sliders -----------
    @IBAction func criterias(_ sender: UISlider)
    {
		let calculate = Calculate()

		switch sender.tag
		{
		case 0:
			criteria1 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade1 updated */
			{
				gradeOn = 30; criteria1 = calculate.gradeWithGradeOn(criterias: criteria1, gradeOn: gradeOn)
				label_grade1.text = String(criteria1)
			}
			else
			{
				gradeOn = 100; criteria1 = calculate.gradeWithGradeOn(criterias: criteria1, gradeOn: gradeOn)
				label_grade1.text = String(criteria1)
			}
			break
		case 1:
			criteria2 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade2 updated */
			{
				gradeOn = 30; criteria2 = calculate.gradeWithGradeOn(criterias: criteria2, gradeOn: gradeOn)
				label_grade2.text = String(criteria2)
			}
			else
			{
				gradeOn = 100; criteria2 = calculate.gradeWithGradeOn(criterias: criteria2, gradeOn: gradeOn)
				label_grade2.text = String(criteria2)
			}
			break
		case 2:
			criteria3 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade3 updated */
			{
				gradeOn = 30; criteria3 = calculate.gradeWithGradeOn(criterias: criteria3, gradeOn: gradeOn)
				label_grade3.text = String(criteria3)
			
			}
			else
			{
				gradeOn = 100; criteria3 = calculate.gradeWithGradeOn(criterias: criteria3, gradeOn: gradeOn)
				label_grade3.text = String(criteria3)
			}
			break
		case 3:
			criteria4 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade4 updated */
			{
				gradeOn = 30; criteria4 = calculate.gradeWithGradeOn(criterias: criteria4, gradeOn: gradeOn)
				label_grade4.text = String(criteria4)
			}
			else
			{
				gradeOn = 100; criteria4 = calculate.gradeWithGradeOn(criterias: criteria4, gradeOn: gradeOn)
				label_grade4.text = String(criteria4)
			}
			break
		case 4:
			criteria5 = Double(sender.value)
			if switch_grade.isOn == false			/* The conditions to show the labelgrade5 updated */
			{
				gradeOn = 30; criteria5 = calculate.gradeWithGradeOn(criterias: criteria5, gradeOn: gradeOn)
				label_grade5.text = String(criteria5)
			}
			else
			{
				gradeOn = 100; criteria5 = calculate.gradeWithGradeOn(criterias: criteria5, gradeOn: gradeOn)
				label_grade5.text = String(criteria5)
			}
			break
		default:
			break
		}
		//-------------------------------
    }
    //=============================================================================
    //================================== Buttons ==================================
	//----------- Return ------------
    @IBAction func return_students(_ sender: UIButton)
    {
		alert(title: "Return",
			  message: "Are you sure to return?",
			  tag: 3)
		
    }
    //-------------------------------
	//----- Save / go to class ------
    @IBAction func go_classrooms(_ sender: UIButton)
    {
//		if (label_grade1.text == "" || label_grade2.text == "" ||
//		    label_grade3.text == "" || label_grade4.text == "" ||
//		    label_grade1.text == "")
//		{
//			alert(title: "No criterias!",
//				  message: "Please set the all criterias for total grade calculus.",
//				  tag: 2)
//			return
//		}
		
        let calculate = Calculate()
        let save = SaveLoadMenager()
		
		weight1 = Double(field_weight1.text!)!; weight2 = Double(field_weight2.text!)!
		weight3 = Double(field_weight3.text!)!; weight4 = Double(field_weight4.text!)!
		weight5 = Double(field_weight5.text!)!
        
		arrayWeights = [weight1, weight2, weight3, weight4, weight5]
        arrayCriterias = [criteria1, criteria2, criteria3, criteria4, criteria5]
        
        if currentCourse == nil
        {
            alert(title: "Warning",
                  message: "You must choose the course!",
                  tag: 2)
            return
        }
        
		if switch_grade.isOn == false						/* Grade on 30 */
		{
			gradeOn = 30
			if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
			{
				grade30_1 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
														   weights: arrayWeights,
														   gradeOn: gradeOn)
				label_final_grade.text = String(grade30_1)
			}
			else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
			{
				grade30_2 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
														   weights: arrayWeights,
														   gradeOn: gradeOn)
				label_final_grade.text = String(grade30_2)
			}
			else											/* Final grade */
			{
                grade30_3 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
														   weights: arrayWeights,
														   gradeOn: gradeOn)
				label_final_grade.text = String(grade30_3)
			}
		}
		else												/* Grade on 100 */
		{
			gradeOn = 100
			if seg_grades.selectedSegmentIndex == 0			/* Grade 1 */
			{
				grade100_1 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
															weights: arrayWeights,
															gradeOn: gradeOn)
				label_final_grade.text = String(grade100_1)
			}
			else if seg_grades.selectedSegmentIndex == 1	/* Grade 2 */
			{
				grade100_2 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
																weights: arrayWeights,
																gradeOn: gradeOn)
				label_final_grade.text = String(grade100_2)
			}
			else											/* Final grade */
			{
				grade100_3 = calculate.totalGradeWithWeight(criterias: arrayCriterias,
															weights: arrayWeights,
															gradeOn: gradeOn)
				label_final_grade.text = String(grade100_3)
			}
		}
		alert(title: "Save yours grades.",
			  message: "Do you want to save?",
			  tag: 1)
		
		arrayGrades30 = [grade30_1, grade30_2, grade30_3]
		arrayGrades100 = [grade100_1, grade100_2, grade100_3]
		
		dictStudentGrades30.updateValue([currentCourse!: arrayGrades30],
										forKey: studentName) 				/* Add the values to dictionary30 */
		dictStudentGrades100.updateValue([currentCourse!: arrayGrades100],
										 forKey: studentName)				/* Add the values to dictionary100 */
		
		save.saveData(theData: dictStudentGrades30 as AnyObject,			/* Save the dictionaries to load */
					  fileName: "dictionary30")
		save.saveData(theData: dictStudentGrades100 as AnyObject,
					  fileName: "dictionary100")
		
		save.saveData(theData: arrayWeights as AnyObject, fileName: "weights")	/* Save the weights to load */
	//-------------------------------
    }
	//=============================================================================
	
    //================================ Table View =================================
	//--------- Cells number --------
    func tableView(_ tableView: UITableView,
				   numberOfRowsInSection section: Int) -> Int
	{ return arrayCourses.count }
    //-------------------------------
	//------- Cells contents --------
    func tableView(_ tableView: UITableView,
				   cellForRowAt indexPath: IndexPath) -> UITableViewCell
	{
		cell = UITableViewCell(style: UITableViewCellStyle.default,
							   reuseIdentifier: nil)
		cell.textLabel?.font = UIFont.init(name: "Champagne & Limousines", size: 17)
		cell.textLabel?.textAlignment = NSTextAlignment.center
		cell.textLabel?.textColor = UIColor.black
		
		cell.textLabel?.text = arrayCourses[indexPath.row]
		
		return cell
    }
	//-------------------------------
	//-------- Select cells ---------
	func tableView(_ tableView: UITableView,
				   didSelectRowAt indexPath: IndexPath)
	{
		
		if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
		}
		else
		{
			tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
			
			currentCourse = arrayCourses[indexPath.row] /* Choice pour add to dictionary */
		}
	}
	//-------------------------------
	//=============================================================================
    //================================= Keyboard ==================================
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    { self.view.endEditing(true) }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
		if textField == field_weight1
		{ field_weight2.becomeFirstResponder()}
		else if textField == field_weight2
		{ field_weight3.becomeFirstResponder()}
		else if textField == field_weight3
		{ field_weight4.becomeFirstResponder()}
		else if textField == field_weight4
		{ field_weight5.becomeFirstResponder()}
		else
		{ field_weight5.resignFirstResponder()}
		return true
	}
    //=============================================================================
}































