//
//  FilmVC.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 22/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

class FilmVC: UIViewController, PersonProtocol {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var episodeLabel: UIStackView!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var crawLabel: UITextView!
    
    var person: Person!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
        
    func setButtonState() {

    }
        
    @IBAction func previousClicked(_ sender: Any) {
            
        
        setButtonState()
    }
        
        
    @IBAction func nextClicked(_ sender: Any) {
            
        
        setButtonState()
    }
}
