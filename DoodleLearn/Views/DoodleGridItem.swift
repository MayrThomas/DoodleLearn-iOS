//
//  DoodleGridItem.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct DoodleGridItem: View {
    let doodle: Doodle
    
    var body: some View {
        VStack {
            Image(systemName: doodle.thumbnail)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 300, maxHeight: 300)
            Text(doodle.name)
                .font(.title3)
        }
        .padding(4)
    }
}

#Preview {
    DoodleGridItem(doodle: Doodle.testData[0])
}
