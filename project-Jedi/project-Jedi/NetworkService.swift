//
//  NetworkService.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

struct NetworkService {
    
    static func convertURLStrings(with urlString: String) -> URL? {
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
}
