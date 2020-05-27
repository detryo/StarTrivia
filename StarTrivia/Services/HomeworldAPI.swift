//
//  HomeworldAPI.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 27/05/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation
import Alamofire

class HomeworldAPI {
    
    func getHomeworld(url: String, complition: @escaping HomeworldPersonResponseComplition) {
        
        guard let url = URL(string: url) else { return }
        
        AF.request(url).responseJSON { (response) in
            
            if let error = response.error {
                debugPrint(error.localizedDescription)
                complition(nil)
                return
            }
            
            guard let data = response.data else { return complition(nil) }
            let jsonDecoder = JSONDecoder()
            
            do {
                
                let homeworld = try jsonDecoder.decode(Homeworld.self, from: data)
                complition(homeworld)
            } catch {
                
                debugPrint(error.localizedDescription)
                complition(nil)
            }
        }
    }
}
