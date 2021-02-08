//
//  Assignment.swift
//  AssignmentNotebook (NEW)
//
//  Created by  on 12/14/20.
//  Copyright © 2020 ZaCode. All rights reserved.
//

import Foundation


class Assignment: Codable {
    var assignmentName: String
    var className: String
    //var dueDate: String will be changed to Date for Date Picker
    var dueDate: Date
    
    // enum are placeholders that allow us to get info
    enum CodingKeys: String, CodingKey {
        case assignmentName
        case className
        case dueDate
    }
    
     
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        assignmentName = try container.decode(String.self, forKey: .assignmentName)
        className = try container.decode(String.self, forKey: .className)
        dueDate = try container.decode(Date.self, forKey: .dueDate)
    }
    
    init(assignmentName: String, className: String, dueDate: Date) {
        self.assignmentName = assignmentName
        self.className = className
        self.dueDate = dueDate
    }
    
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(assignmentName, forKey: .assignmentName)
        try container.encode(className, forKey: .className)
        try container.encode(dueDate, forKey: .dueDate)

    }

}
