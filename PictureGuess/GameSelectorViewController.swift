//
//  GameSelectorViewController.swift
//  PictureGuess
//
//  Created by Labor on 2018. 10. 11..
//  Copyright © 2018. Labor. All rights reserved.
//

import UIKit

class GameSelectorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToGameSelector(_ segue: UIStoryboardSegue)  {}

    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gameViewController = segue.destination as? GameViewController
        gameViewController?.difficultyFactor = CGFloat(difficultySegmentedControl.selectedSegmentIndex + 1)
    }
    
}
