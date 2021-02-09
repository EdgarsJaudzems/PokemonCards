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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let pokemon = pokemon {
            ImageController.getImage(for: pokemon.imageURL ?? "No image") { (image) in
                self.pokemonImageView.image = image
            }
        } else {
            print("Pokemon image is nil")
        }
    }
}
