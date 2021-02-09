//
//  Pokemon.swift
//  PokemonCards
//
//  Created by Edgars Jaudzems on 09/02/2021.
//

import Foundation


struct Pokemon: Decodable {
    let name: String
    var imageUrl: String?
    //let number_Card: String
    let number: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl
     //   case number_Card = "number"
        case number
    }
}

struct Card: Decodable {
    let cards: [Pokemon]
}
