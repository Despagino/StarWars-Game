//
//  CharacterCollectionViewController.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 2/25/22.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var characterLabel: UILabel!
    
    private var displayedCharacters: [Character] = []
    private var targetCharacter: Character?
    private var selectedFaction = "jedi"

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters(for: selectedFaction)
    }
    
    func shuffleCharacters(for faction: String) {
        if faction == "jedi" {
            let jediGroup = CharacterController.jedi.prefix(3)
            displayedCharacters = Array(jediGroup)
            targetCharacter = CharacterController.sith.randomElement()
        } else if (faction == "sith") {
            let sithGroup = CharacterController.sith.prefix(3)
            displayedCharacters = Array(sithGroup)
            targetCharacter = CharacterController.jedi.randomElement()
        }
        updateViews()
    }

    func updateViews() {
        guard let character = targetCharacter else { return }
        displayedCharacters.append(character)
        displayedCharacters.shuffle()
        collectionView.reloadData()
        characterLabel.text = "Find \(character.name)"
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayedCharacters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CharacterCollectionViewCell else { return UICollectionViewCell()}
    
        let character = displayedCharacters [indexPath.row]
        
        cell.displayImage(for: character)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    
    

}
