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
                        guard let parsedFilm = filmParse(data: data) else { return }
                        var film = Film()
                        film = parsedFilm
                        print(film.title, film.characters)
                    } else if urlString.contains("people") {
                        guard let parsedCharacter = characterParse(data: data) else { return }
                        var person = Person()
                        person = parsedCharacter
                        print(person.name, person.speciesURL)
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
    
    private static func filmParse(data: Data) -> Film? {
        do {
            let decoder = JSONDecoder()
            let film = try decoder.decode(Film.self, from: data)
            return film
        } catch {
            print("Film JSON Error! \(error)")
            return nil
        }
    }
    
    private static func characterParse(data: Data) -> Person? {
        do {
            let decoder = JSONDecoder()
            let person = try decoder.decode(Person.self, from: data)
            return person
        } catch {
            print("Character JSON Error! \(error)")
            return nil
        }
    }
}
