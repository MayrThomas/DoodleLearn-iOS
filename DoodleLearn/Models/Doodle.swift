//
//  Doodle.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import Foundation

struct Doodle: Identifiable, Decodable {
    let id = UUID()
    
    var name: String
    var difficulty: Int
    var thumbnail: String
    
    var steps: [Step]

    
    static let testData: [Doodle] = [
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
        Doodle(name: "Cat", difficulty: 3, thumbnail: "cat", steps: Step.testData),
    ]
}
