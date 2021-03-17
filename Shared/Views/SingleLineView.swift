//
//  SingleLineView.swift
//  CourseSelectionAssistant
//
//  Created by Russell Gordon on 2021-03-17.
//

import SwiftUI

struct SingleLineView: View {
    
    // MARK: Stored properties
    var text: String
    var emphasized: Bool = false
    
    // MARK: Computed properties
    var body: some View {
        
        HStack {
            if emphasized {
                Text(text)
                    .font(Font.system(.headline).smallCaps())
                    .padding(.bottom, 3)
            } else {
                Text(text)
                    .padding(.bottom, 7)
            }
            
            Spacer()
        }

    }
}

struct SingleLineView_Previews: PreviewProvider {
    static var previews: some View {
        SingleLineView(text: "Hi there", emphasized: true)
        SingleLineView(text: "How are you")

    }
}
