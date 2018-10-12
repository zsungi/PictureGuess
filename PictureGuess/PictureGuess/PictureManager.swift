//
//  PictureManager.swift
//  PictureGuess
//
//  Created by Labor on 2018. 10. 11..
//  Copyright © 2018. Labor. All rights reserved.
//

import Foundation
import UIKit

class PictureManager: NSObject {
    private let pictures: [AnyObject]?
    public let choices = 3
    public var picturesQueriedCount = 0
    public var correctAnswerCount = 0
    public var wrongAnswerCount = 0
    
    public var kivalasztottak = [String?]()
    public var kivalasztottint = [Int?]()
    public var nevek = ["Dávid","Tüdő","Doma","Kégel","Koncsár","Ágoston","Boris","Budai","Réka","Laci"]
    

    
    

override init() {
    let picturesAsset = NSDataAsset(name: "Pictures")
    
    do {
        var format = PropertyListSerialization.PropertyListFormat.xml
        pictures = try PropertyListSerialization.propertyList(from: picturesAsset!.data, options: .mutableContainersAndLeaves, format: &format) as? [AnyObject]
    } catch {
        pictures = nil
    }
    
    super.init()
}

func getRandomPicture(_ picture: inout UIImage?, titles: inout [String], pictureTitleIndex: inout Int) {
    guard let pictures = pictures else {
        return
    }
    
    //van e 3 ember?
    
    //kiválasztottint tömb létrehozása:
    for index in 0..<kivalasztottak.count {
        kivalasztottint.append(nevek.index(of: (String??(kivalasztottak[index]) as AnyObject) as! String))
    }

    
    // kiválasztott kép a kivalasztottint tömbben
    let selectedPictureIndex = kivalasztottint.randomElement()
    print("kivalasztottint: \(kivalasztottint)")
    
    //a kiválasztott kép törlése a kivalasztottint arrayből
    kivalasztottint.remove(at: kivalasztottint.index(of: selectedPictureIndex!!)!)
    print("kivalasztottint: \(kivalasztottint)")
    
    
    // egyedi véletlen képcímek kiválasztása
    var titlesToReturn = [String]()
    for _ in 0..<choices - 1 {
        let randomIndex = Int(arc4random_uniform(UInt32(kivalasztottint.count - 1)))
        if let randomPicture = pictures[kivalasztottint[randomIndex]!] as? [String : String] {
            titlesToReturn.append(randomPicture["title"]!)
        }
        kivalasztottint.remove(at: randomIndex)
    }
    print("titles: \(titlesToReturn)")
    
    
    // választott képcím beszúrása a véletlen képcímek közé, véletlen helyre :)
    pictureTitleIndex = Int(arc4random_uniform(UInt32(choices)))
    if let chosenPicture = pictures[selectedPictureIndex!!] as? [String: String] {
        titlesToReturn.insert(chosenPicture["title"]!, at: pictureTitleIndex)
        picture = UIImage(named: chosenPicture["image"]!+"-"+"\(Int.random(in: 1...Int(chosenPicture["piece"]!)!)).jpg")!
    }
    
    titles = titlesToReturn
}
}
