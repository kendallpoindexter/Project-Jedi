//
//  Homeworld.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Homeworld: Decodable {
    var name: String?
    static var shared = Homeworld()
}
