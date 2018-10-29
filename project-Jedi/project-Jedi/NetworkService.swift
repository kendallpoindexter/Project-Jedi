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
//                    } else if urlString.contains("planets") {
//                        guard let parsedHomeworld = homeworldParse(data: data) else { return }
//                        var homeworld = Homeworld()
//                        homeworld = parsedHomeworld
//                        StarWarsData.shared.homeworld = homeworld.name
//                        print("\(StarWarsData.shared.homeworld) from network layer")
//                    } else if urlString.contains("species") {
//                        guard let parsedSpecies = speciesParse(data: data) else { return }
//                        var species = Species()
//                        species = parsedSpecies
//                        StarWarsData.shared.species = species.name
//                        print("\(StarWarsData.shared.species) from network layer")
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
    
     
    
    
}

extension NetworkService {
    
    static func getStarWarsData(with urlString: String) {
        guard let url = convertURLStrings(with: urlString) else { return }
        guard let jsonString = performAPIRequest(with: url) else { return }
        
        if urlString.contains("planets") {
            guard let parsedHomeworld = homeworldParse(data: jsonString) else { return }
            var homeworld = Homeworld()
            homeworld = parsedHomeworld
            StarWarsData.shared.homeworld = homeworld.name
            print("\(StarWarsData.shared.homeworld) from network layer")
        } else if urlString.contains("species") {
            guard let parsedSpecies = speciesParse(data: jsonString) else { return }
            var species = Species()
            species = parsedSpecies
            StarWarsData.shared.species = species.name
            print("\(StarWarsData.shared.species) from network layer")
        } else {
            print("MainSync Network Failure")
            
        }
    }
    
    
    private static func performAPIRequest(with url: URL) -> Data? {
        do {
            return try Data(contentsOf: url)
        } catch {
            print("Download Error: \(error.localizedDescription)")
            return nil
        }
    }
}

extension NetworkService {
    
    private static func convertURLStrings(with urlString: String) -> URL? {
        guard let url = URL(string: urlString) else { return nil }
        return url
    }
    
}

extension NetworkService {
    
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
