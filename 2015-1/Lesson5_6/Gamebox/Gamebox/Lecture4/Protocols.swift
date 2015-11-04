//
//  Protocols.swift
//  Gamebox
//
//  Created by Dal Rupnik on 22/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

struct Kvadrat : Geometrija {
    var x : Double
    var y : Double
    var širina : Double
    var višina : Double
    
    func ploščina() -> Double {
        return širina * višina
    }
    
    mutating func povečaj(faktor: Double) {
        širina = širina * faktor
        višina = višina * faktor
    }
}

protocol Geometrija {
    func ploščina () -> Double
    
    mutating func povečaj (faktor : Double)
}

func printKvadrat () {
    var kvadrat1 = Kvadrat(x: 1.0, y: 10.0, širina: 30.0, višina: 30.0)
    
    var kvadrat2 = Kvadrat(x: 5.0, y: 10.0, širina: 40.0, višina: 40.0)
    
    print("Ploščina 1: \(kvadrat1.ploščina())")
    print("Ploščina 2: \(kvadrat2.ploščina())")
    
    kvadrat2.povečaj(2)
    
    print("Ploščina 2: \(kvadrat2.ploščina())")
}