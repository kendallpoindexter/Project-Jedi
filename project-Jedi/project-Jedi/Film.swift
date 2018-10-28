//
//  Film.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

class Film: Decodable {
    var title: String = ""
    var characters: [String] = []
    static let shared = Film()
}
