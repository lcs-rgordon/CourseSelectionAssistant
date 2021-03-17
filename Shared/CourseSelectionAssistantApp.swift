//
//  CourseSelectionAssistantApp.swift
//  Shared
//
//  Created by Russell Gordon on 2021-03-17.
//

import SwiftUI

@main
struct CourseSelectionAssistantApp: App {
    
    // MARK: Stored properties
    @StateObject private var dataStore = Store()
    
    // MARK: Computed properties
    var body: some Scene {
        WindowGroup {
            ContentView(dataStore: dataStore)
        }
    }
    
}
