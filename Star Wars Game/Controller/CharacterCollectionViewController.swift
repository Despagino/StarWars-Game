//
//  CharacterCollectionViewController.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 2/25/22.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController, FilterSelectionDelegate {
        
    @IBOutlet weak var characterLabel: UILabel!
    
    private var displayedCharacters: [Character] = []
    private var targetCharacter: Character?
    private var selectedFaction = "jedi"

    override func viewDidLoad() {
        super.viewDidLoad()
        shuffleCharacters(for: selectedFaction)
    }
    
    func shuffleCharacters(for faction: String) {
        selectedFaction = faction
        if faction == "jedi" {
            CharacterController.jedi.shuffle()
            let jediGroup = CharacterController.jedi.prefix(3)
            displayedCharacters = Array(jediGroup)
            targetCharacter = CharacterController.sith.randomElement()
        } else if (faction == "sith") {
            CharacterController.sith.shuffle()
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
    
    func presentAlert(for character: Character) {
        let success = character == targetCharacter
        let alertController = UIAlertController(title: success ? "Good Job" : "Better Luck Next Time", message: nil, preferredStyle: .alert)
        
        let doneAction = UIAlertAction(title: "Done", style: .cancel)
        let shuffleAction = UIAlertAction(title: "Shuffle", style: .default) { _
            in
            self.shuffleCharacters(for: self.selectedFaction)
        }
        alertController.addAction(doneAction)
        if success {
            alertController.addAction(shuffleAction)
        }
            
       present(alertController, animated: true)
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
        let character = displayedCharacters[indexPath.row]
        presentAlert(for: character)
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToFactionFilter" {
            let destinationVC = segue.destination as? FactionViewController
            destinationVC?.delegate = self
        }
    }
}

extension CharacterCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / 2
        return CGSize(width: width - 15, height: width + 30)
    }
    
}
