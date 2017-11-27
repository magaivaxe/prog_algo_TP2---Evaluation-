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
    
    @IBOutlet weak var field_average1: UITextField!
    @IBOutlet weak var field_average2: UITextField!
    @IBOutlet weak var field_average3: UITextField!
    @IBOutlet weak var field_average4: UITextField!
    @IBOutlet weak var field_average5: UITextField!
    
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //======================== Switch, Segmented and Sliders ======================
    @IBAction func switch_scale(_ sender: UISwitch)
    {
        
    }
    
    @IBAction func grades_choices(_ sender: UISegmentedControl)
    {
        
    }
    
    @IBAction func criterias(_ sender: UISlider)
    {
        
    }
    //=============================================================================
    //================================== Buttons ==================================
    @IBAction func return_students(_ sender: UIButton)
    {
        
    }
    
    @IBAction func go_classrooms(_ sender: UIButton)
    {
        
    }

    //=============================================================================
    
    
    //================================ Table View =================================
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
	//=============================================================================

}
