//
//  ViewController.swift
//  Json_Parsing
//
//  Created by E5000855 on 03/06/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UITextView!
    @IBOutlet weak var myTextField: UITextField!
    
    @IBAction func jsonParseBtn(_ sender: Any) {
        parseJSON()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    
    private func formatStudent(_ student: Student) -> String {
        var result = ""
        result += "id: \(student.id)\n"
        result += "name: \(student.name)\n"
        result += "age: \(student.age)\n"
        result += "email: \(student.email)\n"
        result += "courses:\n"
        for course in student.courses {
            result += "\tcourse_id: \(course.courseID)\n"
            result += "\tcourse_name: \(course.courseName)\n"
            result += "\tcredits: \(course.credits)\n"
        }
        return result
    }
}



extension ViewController {
    
    private func parseJSON() {
        guard let jsonString = myTextField.text, let data = jsonString.data(using: .utf8) else {
            resultText.text = "Invalid JSON format."
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let studentResponse = try decoder.decode(StudentResponse.self, from: data)
            resultText.text = formatStudent(studentResponse.student)
        } catch {
            resultText.text = "Failed to decode JSON: \(error.localizedDescription)"
        }
    }
    
}
