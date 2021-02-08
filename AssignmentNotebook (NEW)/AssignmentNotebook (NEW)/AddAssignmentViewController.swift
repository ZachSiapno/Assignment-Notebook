//
//  AddAssignmentViewController.swift
//  AssignmentNotebook (NEW)
//
//  Created by  on 12/14/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class AddAssignmentViewController: UIViewController {

    
    @IBOutlet weak var classTextField: UITextField!
    
    @IBOutlet weak var assignmentTextField: UITextField!
    

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let className = classTextField.text, let assignment = assignmentTextField.text {
            let newAssignment = Assignment(assignmentName: assignment, className: className, dueDate: datePicker.date)
            
            assignments.append(newAssignment)
            
            sortAssignments()
            
            saveAssignments()
        }
    }
    
    func saveAssignments() {
        if let encoded = try? JSONEncoder().encode(assignments) {
            UserDefaults.standard.set(encoded, forKey: "Assignments")
        }
    }
    
    
    func sortAssignments() {
        assignments = assignments.sorted(by: { $0.dueDate < $1.dueDate})
    }
}
