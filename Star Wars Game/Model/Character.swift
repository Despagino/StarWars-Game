//
//  Character.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 2/25/22.
//

import Foundation
import UIKit

class Character {
    
    let name: String
    let photo: UIImage?
    let faction: String
    
    init(name: String, photo: UIImage?, faction: String) {
        self.name = name
        self.photo = photo
        self.faction = faction
    }
}

extension Character: Equatable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.name == rhs.name && lhs.photo == rhs.photo && lhs.faction == rhs.faction
    }
}
