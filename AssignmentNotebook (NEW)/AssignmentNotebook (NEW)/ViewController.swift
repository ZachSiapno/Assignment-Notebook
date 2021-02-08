//
//  ViewController.swift
//  AssignmentNotebook (NEW)
//
//  Created by  on 12/13/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var assignments: [Assignment] = []

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        loadAssignments()
    }

    // MARK: MVP
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            let currentAssignment = assignments[indexPath.row]
            
            cell.textLabel?.text = currentAssignment.className
            cell.detailTextLabel?.text = currentAssignment.assignmentName
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    
    // MARK: HOW TO ADD ASSIGNMENTS ONTO TABLEVIEW
    @IBAction func whenAddButtonPressed(_ sender: UIBarButtonItem) {
        // MARK: COMMENTED CODE IS ALL OF STRETCH 1, I Just preferred using the add button for Stretch 4
//        let alert = UIAlertController(title: "Add New Assignment", message: nil, preferredStyle: .alert)
//
//        alert.addTextField { (textField) in
//            textField.placeholder = "Add Class Name Here"
//        }
//
//        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (action) in
//            if let assignmentTextfield = alert.textFields?[0] {
//                let assignmentName = assignmentTextfield.text
//                self.assignments.append(assignmentName!)
//                self.tableView.reloadData()
//
//                self.saveAssignments()
//            }
//        }))
//
//        present(alert, animated: true, completion: nil)
        
        performSegue(withIdentifier: "addAssignmentSegue", sender: nil)
        
    }
    
    // MARK: SAVE ASSIGNMENTS
    func loadAssignments() {
        if let objects = UserDefaults.standard.value(forKey: "Assignments") as? Data {
            if let objectsDecoded = try? JSONDecoder().decode(Array.self, from: objects) as [Assignment ] {
                assignments = objectsDecoded
            }
        }
    }
    
    func saveAssignments() {
        if let encoded = try? JSONEncoder().encode(assignments) {
            UserDefaults.standard.set(encoded, forKey: "Assignments")
        }
    }
    
    // MARK: DELETE ASSIGNMENTS --> Note that this is only possible (by my knowledge) by swiping left on each cell, since I did not add an edit button in this version
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            tableView.deselectRow(at: indexPath, animated: true)
            assignments.remove(at: indexPath.row)
            saveAssignments()
            tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        loadAssignments()
        tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAssignmentSegue" {
            let confirm = segue.destination as! AddAssignmentViewController
            confirm.assignments = assignments
        } else {
            let confirm = segue.destination as! DetailsVC
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                confirm.passedAssignment = assignments[selectedIndexPath.row]
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsSegue", sender: nil)
    }
    
    
}

