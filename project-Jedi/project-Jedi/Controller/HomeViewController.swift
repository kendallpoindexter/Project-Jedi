//
//  ViewController.swift
//  project-Jedi
//
//  Created by Kendall Poindexter on 10/25/18.
//  Copyright © 2018 Kendall Poindexter. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.createURLSession(urlString: "https://swapi.co/api/films/2/")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

