//
//  ViewController.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 18/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit
import Alamofire

class SelectPersonVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var hairLabel: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var homeworldButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var spaceshipButton: UIButton!
    @IBOutlet weak var filmButton: UIButton!
    
    var personApi = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        
        let random = Int.random(in: 1...87)
        
        personApi.getRandomPersonUrlAlamo(id: random) { (person) in
            
            if let person = person {
                self.setupView(person: person)
            }
        }
    }
    
    func setupView(person: Person) {
        
        nameLabel.text = person.name
        heightLabel.text = person.height
        massLabel.text = person.mass
        hairLabel.text = person.hair
        birthYear.text = person.birthYear
        genderLabel.text = person.gender
        
        // Asi lo hace un profesional
        homeworldButton.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesButton.isEnabled = !person.vehicleUrls.isEmpty
        spaceshipButton.isEnabled = !person.starshipUrls.isEmpty
        filmButton.isEnabled = !person.filmUrls.isEmpty
    }
    
    @IBAction func homeworldClicked(_ sender: UIButton) {
        
        
    }
    
    @IBAction func vehiclesClicked(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func starshipClicked(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func filmClicked(_ sender: UIButton) {
        
        
    }
    
    
}
