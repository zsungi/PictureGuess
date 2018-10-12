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
    
    @IBOutlet weak var mutassEgyKepet: UIButton!
    //ez mit csinál???
    @IBAction func unwindToGameSelector(_ segue: UIStoryboardSegue)  {}

    @IBOutlet weak var difficultySegmentedControl: UISegmentedControl!
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let gameViewController = segue.destination as? GameViewController
        gameViewController?.difficultyFactor = CGFloat(difficultySegmentedControl.selectedSegmentIndex + 1)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let pictureManager = (UIApplication.shared.delegate as? AppDelegate)?.picturemanager

        if (pictureManager?.kivalasztottak.count)! >= (pictureManager?.choices)! {
        mutassEgyKepet.isEnabled = true
        }
        else {
        mutassEgyKepet.isEnabled = false
        }
     
    }
    
}
