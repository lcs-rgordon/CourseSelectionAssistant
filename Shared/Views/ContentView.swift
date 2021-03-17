//
//  ContentView.swift
//  Shared
//
//  Created by Russell Gordon on 2021-03-17.
//

import SwiftUI

struct ContentView: View {

    // MARK: Stored properties
    
    // This is a derived value
    // The source of truth is the property created at the app entry point
    // Line 14 of CourseSelectionAssistantApp.swift
    @ObservedObject var dataStore: Store
    
    var body: some View {
        Text("There are \(dataStore.courses.list.count) courses in the list of courses obtained.")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataStore: testStore)
    }
}
