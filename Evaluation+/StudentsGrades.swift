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
	var dictStudentGrades: [String:[String:[String]]]!
	
	var weight1: Int!
	var weight2: Int!
	var weight3: Int!
	var weight4: Int!
	var weight5: Int!
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
		weight1 = Int(field_weight1.text!)
		weight2 = Int(field_weight2.text!)
		weight3 = Int(field_weight3.text!)
		weight4 = Int(field_weight4.text!)
		weight5 = Int(field_weight5.text!)
		
		if switch_grade.isOn == false					/* Grade on 30 */
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
		else											/* Grade on 100 */
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
    }
    //=============================================================================
    //================================== Buttons ==================================
    @IBAction func return_students(_ sender: UIButton)
    {
        performSegue(withIdentifier: "segueReturn", sender: nil)
    }
    
    @IBAction func go_classrooms(_ sender: UIButton)
    {
        
    }

    //=============================================================================
    //================================ Functions ==================================
	//--------- Data loads ----------
	func load()
	{
		let load = SaveLoadMenager()
		
		studentName = load.loadData(fileName: "student") as! String					/* Student name load */
		label_name.text = studentName												/* Show current name */
		
		arrayDisciplines = load.loadData(fileName: "disciplinesData") as! [String]	/* Disciplines array */
		
		if load.checkExistingSaves(fileName: "dictionary") == true
		{
			dictStudentGrades = load.loadData(fileName: "dictionary") as! [String:[String:[String]]]
		}
		else
		{
			dictStudentGrades.updateValue([:], forKey: studentName)
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
			
			let currentDiscipline = arrayDisciplines[indexPath.row]
			dictStudentGrades.updateValue([currentDiscipline:[]], forKey: studentName)
			
			save.saveData(theData: dictStudentGrades as AnyObject, fileName: "dictionary")
		}
		
	}
	//-------------------------------
	//=============================================================================

}































