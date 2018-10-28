//
//  Character.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

struct Characters {
    let name: String
    let birthYear: String
    let gender: String
    let homeworldURL: String
    let speciesURL: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case birthYear = "birth_year"
        case gender
        case homeworldURL = "homeworld"
        case speciesURL = "species"
    }
}


