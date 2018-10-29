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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let selectedIndex = selectedIndex else { return }
        getHomeworld(selectedIndex: selectedIndex)
        getSpecies(selectedIndex: selectedIndex)
        //setLabels()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Methods
    
    func setLabels() {
        guard let selectedIndex = selectedIndex else { return }
        nameLabel.text = People.shared.peopleArray[selectedIndex].name
        birthYearLabel.text = People.shared.peopleArray[selectedIndex].birthYear
        genderLabel.text = People.shared.peopleArray[selectedIndex].gender
        
    }
    
    func getHomeworld(selectedIndex: Int) {
        let homeworldURlString = People.shared.peopleArray[selectedIndex].homeworldURL
        
        NetworkService.createURLSession(urlString: homeworldURlString)
    }
    
    func getSpecies(selectedIndex: Int) {
        let speciesURLString = People.shared.peopleArray[selectedIndex].speciesURL[0]
        
        NetworkService.createURLSession(urlString: speciesURLString)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
