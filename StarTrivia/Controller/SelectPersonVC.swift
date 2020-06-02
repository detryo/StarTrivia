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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var personApi = PersonAPI()
    var person : Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        
        let random = Int.random(in: 1...87)
        spinner.startAnimating()
        
        personApi.getRandomPersonUrlAlamo(id: random) { (person) in
            
            self.spinner.stopAnimating()
            if let person = person {
                self.setupView(person: person)
                self.person = person
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
        
        homeworldButton.isEnabled = !person.homeworldUrl.isEmpty
        vehiclesButton.isEnabled = !person.vehicleUrls.isEmpty
        spaceshipButton.isEnabled = !person.starshipUrls.isEmpty
        filmButton.isEnabled = !person.filmUrls.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if var destination = segue.destination as? PersonProtocol {
            destination.person = person
        }
    }
}

protocol PersonProtocol {
    
    var person : Person! { get set }
}
