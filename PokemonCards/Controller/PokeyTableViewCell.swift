//
//  PokeyTableTableViewCell.swift
//  PokemonCards
//
//  Created by Edgars Jaudzems on 10/02/2021.
//

import UIKit

class PokeyTableViewCell: UITableViewCell {

    @IBOutlet weak var pokeyImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardValueLabel: UILabel!
    @IBOutlet weak var subtypeLabel: UILabel!
    @IBOutlet weak var supertypeLabel: UILabel!
    
    
    func setUI(with: Pokemon) {
        
        nameLabel.text = "Name: " + with.name
        cardValueLabel.text = "Card value: " + with.number

        
        if with.subtype != nil {
            subtypeLabel.text = "Card: " + with.subtype!
        }
        
        if let supertype = with.supertype {
            supertypeLabel.text = supertype
            if with.supertype == "Trainer" {
                contentView.backgroundColor = .systemGreen
            } else {
                contentView.backgroundColor = .systemRed
            }
        }
        
//        subtypeLabel.text = "Card: " + with.subtype! ?? ""
        //cardValueLabel.text = "Card Value: " + with.number
        
        
        ImageController.getImage(for: with.imageUrl ?? "", comletion: { image in
            self.pokeyImageView.image = image
        })
    }
}
