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

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK: - Methods
    
    func getHomeworld(selectedIndex: Int) {
        let homeworldURlString = People.shared.peopleArray[selectedIndex].homeworldURL
        NetworkService.getStarWarsData(with: homeworldURlString)
        
        //NetworkService.createURLSession(urlString: homeworldURlString)
    }
    
    func getSpecies(selectedIndex: Int) {
        let speciesURLString = People.shared.peopleArray[selectedIndex].speciesURL[0]
        NetworkService.getStarWarsData(with: speciesURLString)
        
        //NetworkService.createURLSession(urlString: speciesURLString)
    }
   


    // MARK: - Tableview Data Source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return People.shared.peopleArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        
        cell.textLabel?.text = People.shared.peopleArray[indexPath.row].name
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedIndex = indexPath.row
        
        return indexPath
    }

    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            guard let selectedIndex = self.selectedIndex else { return }
            getSpecies(selectedIndex: selectedIndex)
            getHomeworld(selectedIndex: selectedIndex)
            let detailViewController = segue.destination as? DetailViewController
            detailViewController?.selectedIndex = selectedIndex
        
    }
}
