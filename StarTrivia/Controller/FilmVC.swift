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
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var producerLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var crawLabel: UITextView!
    
    var person: Person!
    let api = FilmAPI()
    var films = [String]()
    var currentFilm = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        films = person.filmUrls
        previousButton.isEnabled = false
        nextButton.isEnabled = films.count > 1
        guard let firstFilm = films.first else { return }
        getFilm(url: firstFilm)
        
    }
        
    func getFilm(url: String) {
        
        api.getFilm(url: url) { (film) in
            
            if let film = film {
                
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film: Film) {
        
        titleLabel.text = film.title
        episodeLabel.text = String(film.episode)
        directorLabel.text = film.director
        producerLabel.text = film.producer
        releaseLabel.text = film.releaseData
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: " ")
        crawLabel.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    func setButtonState() {

        nextButton.isEnabled = currentFilm == films.count - 1 ? false : true
        previousButton.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
    }
        
    @IBAction func previousClicked(_ sender: Any) {
            
        currentFilm -= 1
        setButtonState()
    }
        
        
    @IBAction func nextClicked(_ sender: Any) {
            
        currentFilm += 1
        setButtonState()
    }
}
