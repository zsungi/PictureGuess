//
//  StatViewController.swift
//  PictureGuess
//
//  Created by Labor on 2018. 10. 11..
//  Copyright © 2018. Labor. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {

    @IBAction func resetStats(_ sender: UIButton) {
        let pictureManager = (UIApplication.shared.delegate as? AppDelegate)?.picturemanager
        pictureManager!.correctAnswerCount = 0
        pictureManager!.picturesQueriedCount = 0
        pictureManager!.wrongAnswerCount = 0
        
        queriedPictureCountLabel.text = "\(pictureManager!.picturesQueriedCount)"
        correctAnswerCountLabel.text = "\(pictureManager!.correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(pictureManager!.wrongAnswerCount)"
        
    }
    
    @IBOutlet weak var queriedPictureCountLabel: UILabel!
    
    @IBOutlet weak var correctAnswerCountLabel: UILabel!
    @IBOutlet weak var wrongAnswerCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let pictureManager = (UIApplication.shared.delegate as? AppDelegate)?.picturemanager
        
        queriedPictureCountLabel.text = "\(pictureManager!.picturesQueriedCount)"
        correctAnswerCountLabel.text = "\(pictureManager!.correctAnswerCount)"
        wrongAnswerCountLabel.text = "\(pictureManager!.wrongAnswerCount)"
    }

}
