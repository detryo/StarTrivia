//
//  VehiclesVC.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 22/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class VehiclesVC: UIViewController, PersonProtocol {
    
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
    let api = VehicleApi()
    var vehicles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        vehicles = person.vehicleUrls
        
        guard let firstVehicle = vehicles.first else { return }
        getVehicle(url: firstVehicle)
    }

    func getVehicle(url: String) {
        api.getVehicle(url: url) { (vehicle) in
            if let vehicle = vehicle {
                self.setupView(vehicle: vehicle)
            }
        }
    }
    
    func setupView(vehicle: Vehicle) {
        nameLabel.text = vehicle.name
        modelLabel.text = vehicle.model
        makerLabel.text = vehicle.manufacturer
        costLabel.text = vehicle.cost
        lengthLabel.text = vehicle.length
        speedLabel.text = vehicle.speed
        crewLabel.text = vehicle.crew
        passangersLabel.text = vehicle.passengers
    }
    
    @IBAction func previousClicked(_ sender: UIButton) {
        
        
    }
    
    
    @IBAction func nextClicked(_ sender: UIButton) {
        
        
    }
    
}
