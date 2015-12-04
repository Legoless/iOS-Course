//
//  Status.swift
//  Gamebox
//
//  Created by Dal Rupnik on 21/10/15.
//  Copyright © 2015 Unified Sense. All rights reserved.
//

import Foundation

enum Status : UInt
{
    case Wishlist, Purchased, InProgress, Finished
    
    func toRawValue () -> UInt {
        switch (self) {
        case .Wishlist:
            return 0
        case .Purchased:
            return 1
        case .InProgress:
            return 2
        case .Finished:
            return 3
        }
    }
}