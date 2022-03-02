//
//  FactionViewController.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 3/2/22.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    
    func shuffleCharacters(for faction: String)
}


class FactionViewController: UIViewController {

    weak var delegate: FilterSelectionDelegate?
    
    @IBAction func SithButtonPressed(_ sender: UIButton) {
        delegate?.shuffleCharacters(for: "sith")
        self.dismiss(animated: true)
    }
    
}
