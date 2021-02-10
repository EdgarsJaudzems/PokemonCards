//
//  PokemonDetailViewController.swift
//  PokemonCards
//
//  Created by Edgars Jaudzems on 09/02/2021.
//

import UIKit

class PokemonDetailViewController: UIViewController {

    var pokemon: Pokemon?
        
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonSupertype: UILabel!
    @IBOutlet weak var pokemonSubtype: UILabel!
    @IBOutlet weak var pokemonHp: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageUrl ?? "") { (image) in
                self.pokemonImageView.image = image
            }
        } else {
            print("Pokemon image is nil")
        }
        
        pokemonId.text = "ID: \(pokemon?.id ?? "No id")"
        pokemonName.text = "Name: \(pokemon?.name ?? "No name")"
        pokemonSupertype.text = "Supertype: \(pokemon?.supertype ?? "No supertype information")"
        pokemonSubtype.text = "Subtype: \(pokemon?.subtype ?? "No subtype information")"
        pokemonHp.text = "HP: \(pokemon?.hp ?? "No information")"
        
    }
    
}
