//
//  DetailsVC.swift
//  AssignmentNotebook (NEW)
//
//  Created by  on 12/14/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    
    @IBOutlet weak var classLabel: UILabel!
    
    @IBOutlet weak var assignmentLabel: UILabel!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    var passedAssignment: Assignment!
        // this will call the assignment class
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        classLabel.text = passedAssignment.className
        assignmentLabel.text = passedAssignment.assignmentName
        //dueDateLabel.text = passedAssignment.dueDate <---  remove for datePicker
        
        // the code below is how you convert it a date into a string
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd, yyyy H:mm a"
        dueDateLabel.text = dateFormatterPrint.string(from: passedAssignment.dueDate)

        
    }
    

    

}
