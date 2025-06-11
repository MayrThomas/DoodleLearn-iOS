//
//  DoodleStep.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import Foundation

struct Step: Identifiable {
    let id = UUID()
    
    var title: String
    var description: String
    var image: String
    
    static let testData: [Step] = [
        Step(title: "Head", description: "We will start by making the head. Begin by drawing a circle as big or as small as you like", image: "circle"),
        Step(title: "Ears", description: "We will now add two ears to our cat to make our head circle look more like what we actually want to draw", image: "triangle"),
        Step(title: "Face", description: "Now add some eyes and whiskers to complete the head of our cat", image: "face.smiling"),
        Step(title: "Body", description: "Optionally we will now add a body by drawing an oval that is connected to our already drawn head and adding a tail and legs to it", image: "cat")
    ]
}
