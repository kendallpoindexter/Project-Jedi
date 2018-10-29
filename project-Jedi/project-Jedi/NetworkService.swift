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
                        //var film = Film()
                        Film.shared = parsedFilm
                        print(Film.shared.title, Film.shared.characters)
                    } else if urlString.contains("people") {
                        guard let parsedCharacter = characterParse(data: data) else { return }
                        var person = Person()
                         person = parsedCharacter
                        People.shared.peopleArray.append(person)
                        print(People.shared.peopleArray)
                    } else if urlString.contains("planets") {
                        
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
    
    private static func homeworldParse(data: Data) -> Homeworld? {
        do {
            let decoder = JSONDecoder()
            let homeworld = try decoder.decode(Homeworld.self, from: data)
            return homeworld
        } catch {
            print("HomeWorld Error! \(error)")
            return nil 
        }
    }
    
    private static func speciesParse(data: Data) -> Species? {
        do {
            let decoder = JSONDecoder()
            let species = try decoder.decode(Species.self, from: data)
            return species
        } catch {
            print("Species Error! \(error)")
            return nil
        }
    }
}
