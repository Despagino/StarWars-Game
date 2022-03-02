//
//  FactionViewController.swift
//  Star Wars Game
//
//  Created by Gino Tasis on 3/2/22.
//

import UIKit

protocol FilterSelectionDelegate: AnyObject {
    
    func selected(faction: String)
    
}


class FactionViewController: UIViewController {

    weak var delegate: FilterSelectionDelegate?
    
    @IBAction func SithButtonPressed(_ sender: UIButton) {
        delegate?.selected(faction: "sith")
        self.dismiss(animated: true)
    }
    
}
