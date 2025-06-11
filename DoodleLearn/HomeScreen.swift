//
//  HomeScreen.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct HomeScreen: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(filterDoodleData(searchText: searchText)) { doodle in
                        NavigationLink(destination: DoodleView(doodle: doodle)) {
                            DoodleGridItem(doodle: doodle)
                                .padding()
                        }
                        .navigationTitle(doodle.name)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }.searchable(text: $searchText, placement: .toolbar)
        }
    }
    
    private func filterDoodleData(searchText: String) -> [Doodle] {
        if !searchText.isEmpty {
            return Doodle.testData.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        return Doodle.testData
    }
}

#Preview {
    HomeScreen()
}
