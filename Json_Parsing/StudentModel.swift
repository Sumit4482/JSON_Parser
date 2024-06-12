//
//  StudentModel.swift
//  Json_Parsing
//
//  Created by E5000855 on 03/06/24.
//

import Foundation

struct StudentResponse: Codable {
    let student: Student
}

struct Student: Codable {
    let id: Int
    let name: String
    let age: Int
    let email: String
    let courses: [Course]
}

struct Course: Codable {
    let courseID: String
    let courseName: String
    let credits: Int
    
    enum CodingKeys: String, CodingKey {
        case courseID = "course_id"
        case courseName = "course_name"
        case credits
    }
}
