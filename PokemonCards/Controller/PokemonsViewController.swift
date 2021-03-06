//
//  ViewController.swift
//  PokemonCards
//
//  Created by Edgars Jaudzems on 09/02/2021.
//

import UIKit
import AVFoundation

class PokemonsViewController: UIViewController {
    
    var pokey: [Pokemon] = []
    var player: AVAudioPlayer!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playSound()
        self.title = "Pokémon List"
        getPokemonData()

    }
    
    func getPokemonData(){
        let url = URL(string: "https://api.pokemontcg.io/v1/cards")!
        
        NetworkController.performRequest(for: url, httpMethod: .get) {(data, err) in
            if let error = err {
                print("getting err from url \(url.absoluteString) , error: \(error.localizedDescription)")
            }
            
            if let data = data {
                do{
                   
                    let card = try JSONDecoder().decode(Card.self, from: data)
                    self.pokey = card.cards
                }catch{
                    print("failed to decode pokemon data \(error) , data: \(data)")
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else{
                print("data is nil")
            }
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "pikachuSound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
    


    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemonDetail" {
            // Get the new view controller using segue.destination.
            if let vc = segue.destination as? PokemonDetailViewController, let row = tableView.indexPathForSelectedRow?.row {
                // Pass the selected object to the new view controller.
                vc.pokemon = pokey[row]
            }
            
        }
    }

    
}

extension PokemonsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokey.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "pokemonCell", for: indexPath) as? PokeyTableViewCell else {
            return UITableViewCell()
        }
        
        let poke = pokey[indexPath.row]
        cell.setUI(with: poke)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
}
