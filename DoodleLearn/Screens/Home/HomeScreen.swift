//
//  HomeScreen.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 11.06.25.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var viewModel: HomeScreenViewModel
    @State private var searchText = ""
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.doodleList) { doodle in
                        NavigationLink(destination: DoodleView(doodle: doodle)) {
                            DoodleGridItem(doodle: doodle)
                                .padding()
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .searchable(text: $searchText, placement: .toolbar)
            .onChange(of: searchText, initial: false) {
                viewModel.searchText = searchText
                viewModel.filterDoodleList()
            }
        }
    }
}

#Preview {
    HomeScreen(viewModel: HomeScreenViewModel(repository: LocalDoodleRepository()))
}
