//
//  CourseDetailView.swift
//  CourseSelectionAssistant
//
//  Created by Russell Gordon on 2021-03-17.
//

import SwiftUI

struct CourseDetailView: View {
    
    // MARK: Stored properties
    var course: Course
    @State private var courseImage = UIImage()
    
    // MARK: Computed properties
    var body: some View {
        
        ScrollView {
            
            Text(course.name)
                .font(.title)
                .padding(.top, 10)
                .padding(.horizontal)

            Image(uiImage: courseImage)
                .resizable()
                .scaledToFit()
            
            Group {
                
                Text(course.ministryDescription)
                    .padding(.bottom, 7)
                
                SingleLineView(text: "Subject Area", emphasized: true)
                SingleLineView(text: course.curriculum)
                
                SingleLineView(text: "Grade Level", emphasized: true)
                SingleLineView(text: "\(course.grade)")
                
                SingleLineView(text: "Prerequisites", emphasized: true)
                if course.prerequisites == "None" {
                    SingleLineView(text: course.prerequisites)
                } else {
                    SingleLineView(text: "Any of: \(course.prerequisites)")
                }
                
            }
            .padding(.horizontal)

        }
        .navigationTitle(course.code)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            
            // Ensure there is an image for this course
            guard let baseUrl = course.baseUrl,
                  let heroImage = course.heroImage else {
                courseImage = UIImage(systemName: "questionmark.diamond.fill")!
                return
            }
            
            // Now get the actual image
            fetchCourseImage(from: "\(baseUrl)\(heroImage)")
        }
        
    }
    
    // Get the hero image
    func fetchCourseImage(from address: String) {
        
        // 1. Prepare a URLRequest to send our encoded data as JSON
        let url = URL(string: address)!
        
        // 2. Run the request and process the response
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // handle the result here – attempt to unwrap optional data provided by task
            guard let imageData = data else {
                
                // Show the error message
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                
                return
            }
            
            // Update the UI on the main thread
            DispatchQueue.main.async {
                
                // Attempt to create an instance of UIImage using the data from the server
                guard let loadedImage = UIImage(data: imageData) else {
                    
                    // If we could not load the image from the server, show a default image
                    courseImage = UIImage(systemName: "questionmark.diamond.fill")!
                    return
                }
                
                // Set the image loaded from the server so that it shows in the user interface
                courseImage = loadedImage
                
            }
            
        }.resume()
        
    }
    
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CourseDetailView(course: testStore.courses.list.first!)
        }
        NavigationView {
            CourseDetailView(course: testStore.courses.list[5])
        }
    }
}
