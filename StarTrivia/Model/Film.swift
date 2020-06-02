//
//  Film.swift
//  StarTrivia
//
//  Created by Cristian Sedano Arenas on 02/06/2020.
//  Copyright © 2020 Cristian Sedano Arenas. All rights reserved.
//

import Foundation

struct Film: Codable {
    
    let title: String
    let episode: Int
    let crawl: String
    let director: String
    let producer: String
    let releaseData: String
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case episode = "episode_id"
        case director
        case crawl = "opening_crawl"
        case producer
        case releaseData = "release_date"
    }
}
