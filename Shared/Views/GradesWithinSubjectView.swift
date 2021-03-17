//
//  GradesWithinSubjectView.swift
//  CourseSelectionAssistant
//
//  Created by Russell Gordon on 2021-03-17.
//

import SwiftUI

struct GradesWithinSubjectView: View {
    
    // MARK: Stored properties
    var courses: [Course]
    
    // MARK: Computed properties
    var coursesByGrade: [(key: Int, value: [Course])] {
        
        // Only return courses offered at LCS
        let filteredCourses = courses.filter({ course in
            return course.offeredAtLcs == true
        })
        
        // Create a dictionary with courses grouped by grade level
        return Dictionary(grouping: filteredCourses, by: { $0.grade }).sorted(by: { $0.key < $1.key } )
        
    }
    
    var body: some View {
        
        List {
            
            // Iterate over the grades
            ForEach(coursesByGrade, id: \.key) { key, value in
                
                Section(header: Text("\(key)")) {
                    
                    // Iterate over the courses within this grade
                    ForEach(value.sorted(by: { $0.name < $1.name })) { course in
                        

                        NavigationLink(destination: CourseDetailView(course: course)) {
                            
                            VStack(alignment: .leading) {
                                Text(course.name)
                                Text(course.type)
                                    .font(.caption)
                            }

                        }
                        
                        
                    }
                }
                
            }
            
        }
        .navigationTitle("Courses")
    }
}

struct GradesWithinSubjectView_Previews: PreviewProvider {
    static var previews: some View {
        GradesWithinSubjectView(courses: testStore.courses.list)
    }
}
