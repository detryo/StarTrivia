//
//  StarshipVC.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 22/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class StarshipVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var makerLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var crewLabel: UILabel!
    @IBOutlet weak var passangersLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var person : Person!
    let api = StarshipAPI()
    var starship = [String]()
    var currentStarship = 0 //

    override func viewDidLoad() {
        super.viewDidLoad()

        starship = person.starshipUrls
        nextButton.isEnabled = starship.count > 1
        previousButton.isEnabled = false
        guard let firstStarship = starship.first else { return }
        getStarship(url: firstStarship)
        
    }

    func getStarship(url: String) {
        api.getStarship(url: url) { (starship) in
            if let starship = starship {
                self.setupView(starship: starship)
            }
        }
    }
    
    func setupView(starship: Starship) {
        nameLabel.text = starship.name
        modelLabel.text = starship.model
        makerLabel.text = starship.manufacturer
        costLabel.text = starship.cost
        lengthLabel.text = starship.length
        speedLabel.text = starship.speed
        crewLabel.text = starship.crew
        passangersLabel.text = starship.passengers
    }
    
    func setButtonState() {
        nextButton.isEnabled = currentStarship == starship.count - 1 ? false : true
        previousButton.isEnabled = currentStarship == 0 ? false : true
        getStarship(url: starship[currentStarship])
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        currentStarship -= 1
        setButtonState()
    }
    
    

    @IBAction func nextClicked(_ sender: UIButton) {
        currentStarship += 1
        setButtonState()
    }
}
