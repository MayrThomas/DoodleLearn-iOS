//
//  LocalDoodleRepository.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 12.06.25.
//

import Foundation

class LocalDoodleRepository: DoodleRepository {
    
    func getDoodles() throws  -> [Doodle] {
        var fileUrl = Bundle.main.url(forResource: "doodles", withExtension: "json")
        
        if let url = fileUrl {
            var data = try Data(contentsOf: url)
            
            let doodles = try JSONDecoder().decode([Doodle].self, from: data)
            
            return doodles
        } else {
            throw FileHandlingError.invalidUrl
        }
    }
    
    enum FileHandlingError: Error {
        case invalidUrl
    }
}
