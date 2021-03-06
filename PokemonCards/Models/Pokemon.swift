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
    let supertype: String?
    let subtype: String?
    let id: String
    var number: String
    var hp: String?

    enum CodingKeys: String, CodingKey {
        case name
        case imageUrl
        case supertype
        case subtype
        case id
        case number
        case hp
        
      //  case name, imageUrl, supertype ... 
    }
}

struct Card: Decodable {
    let cards: [Pokemon]
}


