//
//  Person.swift
//  PairRandomizer
//
//  Created by Ian Becker on 8/28/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import Foundation

class Person: Codable {
    
    var fullName: String
    
    init(fullName: String) {
        self.fullName = fullName
    }
} // End of class

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.fullName == rhs.fullName
    }
} // End of extension
