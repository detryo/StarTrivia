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
    
    var personApi = PersonAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func randomClicked(_ sender: Any) {
        
        let random = Int.random(in: 1...87)
        
        personApi.getRandomPersonUrlAlamo(id: random) { (person) in
            
            if let person = person {
                
                self.nameLabel.text = person.name
                self.heightLabel.text = person.height
                self.massLabel.text = person.mass
                self.hairLabel.text = person.hair
                self.birthYear.text = person.birthYear
                self.genderLabel.text = person.gender
            }
        }
    }
}
