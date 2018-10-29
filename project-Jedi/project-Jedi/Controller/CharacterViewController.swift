//
//  CharacterViewController.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/25/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class CharacterViewController: UITableViewController {
    
    //MARK: - Property
    
    var selectedIndex: Int?
    
    //MARK:- Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Methods
    
    func configureTitle() {
       
    }
}

//MARK: - TableView Data Source Methods

extension CharacterViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return People.shared.peopleArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        cell.textLabel?.text = People.shared.peopleArray[indexPath.row].name
        
        return cell
    }
    
}

//MARK: - TableView Delegate Methods

extension CharacterViewController {
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        
        return indexPath
    }
}

//MARK: - Navigation

extension CharacterViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedIndex = self.selectedIndex else { return }
        getSpecies(selectedIndex: selectedIndex)
        getHomeworld(selectedIndex: selectedIndex)
        let detailViewController = segue.destination as? DetailViewController
        detailViewController?.selectedIndex = selectedIndex
        
    }
}

//MARK: -  Network Request Methods

extension CharacterViewController {
    
    func getHomeworld(selectedIndex: Int) {
        let homeworldURlString = People.shared.peopleArray[selectedIndex].homeworldURL
        NetworkService.getStarWarsData(with: homeworldURlString)
    }
    
    func getSpecies(selectedIndex: Int) {
        let speciesURLString = People.shared.peopleArray[selectedIndex].speciesURL[0]
        NetworkService.getStarWarsData(with: speciesURLString)
    }
}
