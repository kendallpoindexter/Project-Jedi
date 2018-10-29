//
//  ViewController.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/25/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK: - Properties
    
    var peopleArray = People().peopleArray
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black 
        
        NetworkService.createURLSession(urlString: "https://swapi.co/api/films/2/")
    }
    
    //MARK: - Methods
    
    func populatePeopleArray() {
        for urlStrings in Film.shared.characters {
            NetworkService.createURLSession(urlString: urlStrings)
        }
    }
    
    //MARK: - Actions
    
    @IBAction func episodeTapped(_ sender: UIButton) {
         populatePeopleArray()
    }
  
    @IBAction func viewCharactersTapped(_ sender: UIButton) {
        //This action triggers the "HomeToCharacterSegue" which is done threw the storyboard
    }
}

