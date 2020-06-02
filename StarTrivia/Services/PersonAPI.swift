//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 20/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    // Web request with Alamofire and Codable
    func getRandomPersonUrlAlamo(id: Int, completion: @escaping PersonResponseComplition) {
        
        guard let url = URL(string: "\(PERSON_URL)\(id)") else { return }
        
        AF.request(url).responseJSON { (response) in
            
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(nil)
                return
            }
            
            guard let data = response.data else { return completion(nil) }
            
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let person = try jsonDecoder.decode(Person.self, from: data)
                completion(person)
                
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    // Parsing with SwiftyJSON
    private func parsePersonSwifty(json: JSON) -> Person {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmUrls = json["films"].arrayValue.map({ $0.stringValue })
        let vehicleUrls = json["vehicles"].arrayValue.map({ $0.stringValue })
        let starshipUrls = json["starships"].arrayValue.map({ $0.stringValue })
        
        return Person(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmUrls: filmUrls, vehicleUrls: vehicleUrls, starshipUrls: starshipUrls)
    }
}
