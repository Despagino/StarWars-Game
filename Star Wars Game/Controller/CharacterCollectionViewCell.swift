//
//  CharacterCollectionViewCell.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 2/25/22.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var characterImage: UIImageView!
    
    func displayImage(for character: Character) {
        characterImage.image = character.photo
        characterImage.contentMode = .scaleAspectFill
        characterImage.clipsToBounds = true
    }
    
}
