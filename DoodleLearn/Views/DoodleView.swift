//
//  DoodleView.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct DoodleView: View {
    let doodle: Doodle
    
    var stepCount: Int {
        return doodle.steps.count
    }
    
    var body: some View {
        VStack {
            Image(systemName: doodle.thumbnail)
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .padding(.top, 20)
            
            TabView {
                ForEach(Array(doodle.steps.enumerated()), id: \.offset) { index, step in
                        StepView(step: step, index: index+1, stepCount: stepCount)
                }
            }
            .tabViewStyle(.page)
        }
        .padding(4)
    }
}

#Preview {
    DoodleView(doodle: Doodle.testData[0])
}

struct StepView: View {
    let step: Step
    let index: Int
    let stepCount: Int
    
    var body: some View {
        VStack {
            Text("Step \(index)/\(stepCount)")
                .font(.headline)
                .padding()
            
            
            Text(step.description)
                .padding(16)
            
            Image(systemName: step.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 200, maxHeight: 200)
        }
    }
}
