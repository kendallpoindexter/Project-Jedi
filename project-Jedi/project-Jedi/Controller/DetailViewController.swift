//
//  DetailViewController.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/25/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var selectedIndex: Int?
    
    //MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthYearLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        
        setLabels()
    }
    
    //MARK: - Methods

    func setLabels() {
        guard let selectedIndex = selectedIndex else { return }
        nameLabel.text = People.shared.peopleArray[selectedIndex].name
        birthYearLabel.text = People.shared.peopleArray[selectedIndex].birthYear
        genderLabel.text = People.shared.peopleArray[selectedIndex].gender
        speciesLabel.text = StarWarsData.shared.species
        homeworldLabel.text = StarWarsData.shared.homeworld
    }
}
