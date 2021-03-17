//
//  Course.swift
//  CourseSelectionAssistant (iOS)
//
//  Created by Russell Gordon on 2021-03-17.
//

import Foundation

// This structure has properties that match the columns of this spreadsheet:
//
// https://docs.google.com/spreadsheets/d/1e56a8ysSa0aeeV23Qa-AVT5uxy0-e9h0l_3t2a2bNfY/edit?usp=sharing
//
// ... whose data is accessed via this endpoint:
//
// https://api.sheety.co/92d7eb80d996eaeb34616393ebc6ddcf/courseSelectionAssistant2021/list
//
struct Course: Codable, Identifiable {

    let curriculum: String
    let grade: Int
    let name: String
    let type: String
    let code: String
    let prerequisites: String
    let ministryDescription: String
    let lcsDescription: String
    let offeredAtLcs: Bool
    let heroImage: String?
    let baseUrl: String?
    let id: Int

}
