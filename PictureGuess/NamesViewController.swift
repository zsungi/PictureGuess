//
//  NamesViewController.swift
//  PictureGuess
//
//  Created by Kégl Marcell on 2018. 10. 11..
//  Copyright © 2018. Labor. All rights reserved.
//

import UIKit

class NamesViewController: UIViewController {
    

    
    @IBAction func mehetAMenet(_ sender: UIButton) {
        self.tabBarController!.selectedIndex = 1;
    }
    
    @IBAction func nevek(_ sender: UIButton) {
        let pictureManager = (UIApplication.shared.delegate as? AppDelegate)?.picturemanager
        //ez igy meg nem az igazi, optional ek vannak az arrayben
        if sender.isSelected == false {
        sender.isSelected = true
            pictureManager?.kivalasztottint = []
            pictureManager?.kivalasztottak.append(sender.titleLabel?.text!)
            
        } else {
            sender.isSelected = false
            pictureManager?.kivalasztottak.remove(at: (pictureManager?.kivalasztottak.index(of: sender.titleLabel?.text!))!)
            pictureManager?.kivalasztottint = []

        }
        print ("kivalasztottak: \(String(describing: pictureManager?.kivalasztottak))")
        
        
        
        
    }
    
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
