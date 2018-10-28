//
//  Character.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Person: Decodable {
    var name: String = ""
    var birthYear: String = ""
    var gender: String = ""
    var homeworldURL: String = ""
    var speciesURL: [String] = []
    static var shared = Person()
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case gender
        case homeworldURL = "homeworld"
        case speciesURL = "species"
    }
}


