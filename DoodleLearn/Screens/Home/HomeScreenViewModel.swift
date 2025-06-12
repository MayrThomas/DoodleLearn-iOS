//
//  HomeScreenViewModel.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 12.06.25.
//

import Foundation

@Observable @MainActor class HomeScreenViewModel {
    
    var searchText: String
    var doodleList: [Doodle]
    
    private var _doodleCache: [Doodle] = []
    
    init(repository: DoodleRepository) {
        self.searchText = ""
        
        do {
            self._doodleCache = try repository.getDoodles()
            self.doodleList = []
            
            filterDoodleList()
        } catch {
            self._doodleCache = []
            self.doodleList = []
        }
        
    }
    
    func filterDoodleList() {
        if self.searchText.isEmpty {
            self.doodleList =  _doodleCache
        } else {
            self.doodleList =  self.doodleList.filter { $0.name.lowercased().contains(self.searchText.lowercased())}
        }
    }

}
