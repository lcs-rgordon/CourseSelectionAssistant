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
        
        // Start a list
        List {
            
            // Iterate over the subjects
            ForEach(Array(dataStore.subjects.keys.sorted()), id: \.self) { subject in
                
                Text(subject)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(dataStore: testStore)
    }
}
