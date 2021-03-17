//
//  CoursesStore.swift
//  CourseSelectionAssistant (iOS)
//
//  Created by Russell Gordon on 2021-03-17.
//

import Foundation

// This structure is configured to enable reading of data from this spreadsheet:
//
// https://docs.google.com/spreadsheets/d/1e56a8ysSa0aeeV23Qa-AVT5uxy0-e9h0l_3t2a2bNfY/edit?usp=sharing
//
// ... via this Sheety endpoint:
//
// https://api.sheety.co/92d7eb80d996eaeb34616393ebc6ddcf/courseSelectionAssistant2021/list
//
struct Courses: Codable {
    
    // MARK: Properties
    
    // Will eventually be populated with a list of courses defined in the spreadsheet
    // Begins as an empty list
    var list: [Course] = []
    
}
