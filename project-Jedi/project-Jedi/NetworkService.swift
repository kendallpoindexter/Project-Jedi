//
//  NetworkService.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/28/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import Foundation

struct NetworkService {
    
    static func createURLSession(urlString: String) {
        guard let url = convertURLStrings(with: urlString) else { return }
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failure! \(error)")
            } else if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                if let data = data {
                    if urlString.contains("films") {
                        var films = Films().films
                        films = filmParse(data: data)
                        print(films[0].title)
                    } else if urlString.contains("people") {
                        var people = People().peopleArray
                        people = characterParse(data: data)
                        print(people[0].name)
                    } else {
                        return
                    }
                
                }
            } else {
                guard let response = response else { return}
                print("Failure! \(response)")
            }
        }
        dataTask.resume()
    }
    
     private static func convertURLStrings(with urlString: String) -> URL? {
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
    private static func filmParse(data: Data) -> [Film] {
        do {
            let decoder = JSONDecoder()
            let film = try decoder.decode([Film].self, from: data)
            return film
        } catch {
            print("Film JSON Error! \(error)")
            return []
        }
    }
    
    private static func characterParse(data: Data) -> [person] {
        do {
            let decoder = JSONDecoder()
            let character = try decoder.decode([person].self, from: data)
            return character
        } catch {
            print("Character JSON Error! \(error)")
            return []
        }
    }
}
