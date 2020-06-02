//
//  Constants.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 19/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import UIKit

let BLACK_BG = UIColor.black.withAlphaComponent(0.6).cgColor

let URL_BASE = "https://swapi.dev/api/"
let PERSON_URL = URL_BASE + "people/"

typealias PersonResponseComplition = (Person?) -> Void
typealias HomeworldResponseComplition = (Homeworld?) -> Void
typealias VehicleResponseCompletion = (Vehicle?) -> Void
typealias StarshipResponseCompletion = (Starship?) -> Void
typealias FilmResponseCompletion = (Film?) -> Void
