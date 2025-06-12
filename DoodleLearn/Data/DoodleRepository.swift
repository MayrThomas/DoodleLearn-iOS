//
//  DoodleRepository.swift
//  DoodleLearn
//
//  Created by Thomas Mayr on 12.06.25.
//

import Foundation

protocol DoodleRepository {
    
    func getDoodles() throws -> [Doodle]
}
